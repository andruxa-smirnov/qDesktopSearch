#include "indexerworker.h"
#include "indexerthread.h"
#include "str.h"
#include <QTime>
#include <QThread>
#include <QDebug>
#include <QDirIterator>

indexerWorker::indexerWorker(QString sDir2Index, logger* pLogger, jvm* pJvm/*, lucyindexer* pLucyIndexer*/, QObject *parent) : QObject(parent),
    m_pLogger(pLogger), m_pJvm(pJvm), m_sDir2Index(sDir2Index), m_iIndexedFiles(0), m_iIndexingTime(0), m_iFoundFiles(0), m_pLucyIndexer(nullptr)
{

}

void indexerWorker::doWork()
{
    openIndex();

    connect(this,SIGNAL(getMetaContents(QString,QMap<QString, QStringList>*)),this->m_pJvm,SLOT(getMetaContents(QString,QMap<QString, QStringList>*)), Qt::BlockingQueuedConnection);

    t.start();
    while(true)
    {
        m_iIndexingTime = 0;
        m_iFoundFiles   = 0;
        m_iIndexedFiles = 0;

        if (this->m_pLucyIndexer)
        {
            this->m_pLucyIndexer->onIndexerThreadFinished();
        }
        if(QThread::currentThread()->isInterruptionRequested())
        {
            finishIndexing(true);
            return;
        }
        dir(m_sDir2Index);
        if(QThread::currentThread()->isInterruptionRequested())
        {
            finishIndexing(true);
            return;
        }
        if (this->m_pLucyIndexer)
        {
            this->m_pLucyIndexer->onIndexerThreadFinished();
        }
        if(QThread::currentThread()->isInterruptionRequested())
        {
            finishIndexing(true);
            return;
        }

        m_iIndexingTime = t.elapsed();
        m_pLogger->inf("an indexer thread finished. found#:"+QString::number(getNrOfFoundFiles())+" indexed#:"+QString::number(getNrOfIndexedFiles())+" NrOfFilesInIdx:"+QString::number(getNrOfFilesInIndex())+" time:"+logger::t_elapsed(getIndexTime())+"  dir:"+getIndexedDir());
        QThread::msleep(99999/*milliseconds*/);
        t.restart();
        //TODO: remove fnf files from index
    }

    emit finished();
}

void indexerWorker::dir(QString sDir)
{
    //TODO: how to handle deleted files???

    //is recursive!
    QDirIterator it(sDir, QStringList() << "*", QDir::Files | QDir::Dirs | QDir::NoDotDot | QDir::NoDot | QDir::NoSymLinks, QDirIterator::Subdirectories);
    while (it.hasNext())
    {
        if(QThread::currentThread()->isInterruptionRequested())
        {
            return;
        }

        QString sEntry(it.next());
        sEntry = str::normalizePath(sEntry, false);
        QFileInfo finfo(sEntry);
        if(finfo.isFile())
        {
            file(sEntry, finfo);
        }
    }
}

void indexerWorker::file(QString sAbsPathName, QFileInfo finfo)
{
    m_iFoundFiles++;

    {   //if(file>xxxMB)->return;  //because the jvm has to work on the ui thread
        qint64 iSizeInBytes = finfo.size();
        qint64 iSizeInMB    = iSizeInBytes / 1048576;          //1 MB = 1024 KB = 1048576 Byte
        if(iSizeInMB > 99)
        {
            this->m_pLogger->wrn("file too big to be indexed("+QString::number(iSizeInMB)+"MB) fn:"+sAbsPathName);
            return;
        }
    }

    if(QThread::currentThread()->isInterruptionRequested())
    {
        return;
    }

    if(this->m_pLucyIndexer->isIndexed(sAbsPathName, finfo))
    {
        return;
    }

    if(QThread::currentThread()->isInterruptionRequested())
    {
        return;
    }

    QMap<QString, QStringList>* pMetaContents = new QMap<QString, QStringList>();
    //http://stackoverflow.com/questions/19113719/jni-findclass-function-returns-null
    //http://developer.android.com/training/articles/perf-jni.html#faq_FindClass
    //this->m_pJvm->getMetaContents(sAbsPathName, &metaContents);
    emit getMetaContents(sAbsPathName, pMetaContents);          //needs connect(...Qt::BlockingQueuedConnection);
    enrichMetaContents(sAbsPathName, pMetaContents, finfo);

    if(QThread::currentThread()->isInterruptionRequested())
    {
        return;
    }

    this->m_pLucyIndexer->index(sAbsPathName, pMetaContents, finfo);

    delete pMetaContents;
    pMetaContents = nullptr;

    m_iIndexedFiles++;
}

void indexerWorker::enrichMetaContents(QString sAbsPathName, QMap<QString, QStringList>* pMetas, QFileInfo finfo)
{
    this->addMetaContents(pMetas, "pathname", sAbsPathName);

    {
        QString sDir(finfo.path());
        this->addMetaContents(pMetas, "dir", sDir);
    }
    {
        QString sFN(finfo.fileName());  //with ext
        this->addMetaContents(pMetas, QString::fromStdWString(FIELDNAME_FILENAME), sFN);
    }
    {
        QString sExt(finfo.suffix());   //or completeSuffix
        this->addMetaContents(pMetas, "extension", sExt);
    }
    {
        qint64 iSize = finfo.size();
        this->addMetaContents(pMetas, "size", QString::number(iSize));
    }
    {
        QDateTime lastMod = finfo.lastModified();
        uint uiLastMod = lastMod.toTime_t();
        this->addMetaContents(pMetas, "lastmodified", QString::number(uiLastMod));
    }
}

void indexerWorker::addMetaContents(QMap<QString, QStringList>* pMetas, QString sMetaName, QString sMetaValue)
{
    bool bContains = pMetas->contains(sMetaName);

    if(bContains)
    {
        pMetas->operator [](sMetaName) << sMetaValue;
    }
    else
    {
        QStringList sl;
        sl << sMetaValue;
        pMetas->operator [](sMetaName) = sl;
    }
}

int indexerWorker::getNrOfIndexedFiles()
{
    return this->m_iIndexedFiles;
}
int indexerWorker::getNrOfFilesInIndex()
{
    if(this->m_pLucyIndexer)
        return this->m_pLucyIndexer->getNrOfFilesInIndex();
    return 0;
}
int indexerWorker::getNrOfFoundFiles()
{
    return this->m_iFoundFiles;
}

int indexerWorker::getIndexTime()
{
    return this->m_iIndexingTime;
}

QString indexerWorker::getIndexedDir()
{
    return this->m_sDir2Index;
}

bool indexerWorker::openIndex()
{
    if(!m_pLucyIndexer)
    {
        m_pLucyIndexer = new lucyindexer(this->m_pLogger, this);
        m_pLucyIndexer->open(this->m_sDir2Index);
    }
    return true;
}
void indexerWorker::close()
{
    if(m_pLucyIndexer)
    {
        delete m_pLucyIndexer;
    }
    m_pLucyIndexer = nullptr;
}

indexerWorker::~indexerWorker()
{
    close();
}
lucyindexer* indexerWorker::getIndexer()
{
    return this->m_pLucyIndexer;
}

void indexerWorker::finishIndexing(bool bInterruptionRequested)
{
    m_iIndexingTime = t.elapsed();
    m_pLogger->inf("an indexer thread finished. found#:"+QString::number(getNrOfFoundFiles())+" indexed#:"+QString::number(getNrOfIndexedFiles())+" NrOfFilesInIdx:"+QString::number(getNrOfFilesInIndex())+" time:"+logger::t_elapsed(getIndexTime())+"  dir:"+getIndexedDir());
    close();
    if(bInterruptionRequested)
    {
        QThread::currentThread()->terminate();
    }
}
