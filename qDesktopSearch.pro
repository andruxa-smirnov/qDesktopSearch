QT       += core gui
#QT       += androidextras

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qDesktopSearch
TEMPLATE = app

CONFIG(debug, debug|release) {
    DEFINES += _DEBUG
    DEFINES += DEBUG
}

#would be cool if my libs would also be compiled with this flag
#DEFINES += _ATL_XP_TARGETING

#avoid zlib warnings
DEFINES += _CRT_SECURE_NO_WARNINGS
#make clucene faster
DEFINES += _REENTRANT
DEFINES += NOMINMAX
DEFINES += WIN32_LEAN_AND_MEAN
DEFINES += WIN64_LEAN_AND_MEAN
DEFINES += MAKE_CLUCENE_SHARED_LIB

#//TODO: activate & config for porterStemmer
#DEFINES += _MBCS
#DEFINES += _UNICODE

SOURCES += main.cpp\
        mainwindow.cpp \
    wsearch.cpp \
    wsettings.cpp \
    cfg.cpp \
    emitter.cpp \
    logger.cpp \
    logwnd.cpp \
    zlib/adler32.c \
    zlib/compress.c \
    zlib/crc32.c \
    zlib/deflate.c \
    zlib/gzio.c \
    zlib/inffast.c \
    zlib/inflate.c \
    zlib/inftrees.c \
    zlib/trees.c \
    zlib/zutil.c \
    clucene/CLucene/analysis/standard/StandardAnalyzer.cpp \
    clucene/CLucene/analysis/standard/StandardFilter.cpp \
    clucene/CLucene/analysis/standard/StandardTokenizer.cpp \
    clucene/CLucene/analysis/AnalysisHeader.cpp \
    clucene/CLucene/analysis/Analyzers.cpp \
    clucene/CLucene/analysis/CachingTokenFilter.cpp \
    clucene/CLucene/config/gunichartables.cpp \
    clucene/CLucene/config/repl_lltot.cpp \
    clucene/CLucene/config/repl_tcscasecmp.cpp \
    clucene/CLucene/config/repl_tcslwr.cpp \
    clucene/CLucene/config/repl_tcstod.cpp \
    clucene/CLucene/config/repl_tcstoll.cpp \
    clucene/CLucene/config/repl_tprintf.cpp \
    clucene/CLucene/config/utf8.cpp \
    clucene/CLucene/debug/condition.cpp \
    clucene/CLucene/debug/error.cpp \
    clucene/CLucene/document/DateField.cpp \
    clucene/CLucene/document/DateTools.cpp \
    clucene/CLucene/document/Document.cpp \
    clucene/CLucene/document/Field.cpp \
    clucene/CLucene/document/FieldSelector.cpp \
    clucene/CLucene/document/NumberTools.cpp \
    clucene/CLucene/index/CompoundFile.cpp \
    clucene/CLucene/index/DirectoryIndexReader.cpp \
    clucene/CLucene/index/DocumentsWriter.cpp \
    clucene/CLucene/index/DocumentsWriterThreadState.cpp \
    clucene/CLucene/index/FieldInfos.cpp \
    clucene/CLucene/index/FieldsReader.cpp \
    clucene/CLucene/index/FieldsWriter.cpp \
    clucene/CLucene/index/IndexDeletionPolicy.cpp \
    clucene/CLucene/index/IndexFileDeleter.cpp \
    clucene/CLucene/index/IndexFileNameFilter.cpp \
    clucene/CLucene/index/IndexFileNames.cpp \
    clucene/CLucene/index/IndexModifier.cpp \
    clucene/CLucene/index/IndexReader.cpp \
    clucene/CLucene/index/IndexWriter.cpp \
    clucene/CLucene/index/MergePolicy.cpp \
    clucene/CLucene/index/MergeScheduler.cpp \
    clucene/CLucene/index/MultipleTermPositions.cpp \
    clucene/CLucene/index/MultiReader.cpp \
    clucene/CLucene/index/MultiSegmentReader.cpp \
    clucene/CLucene/index/Payload.cpp \
    clucene/CLucene/index/SegmentInfos.cpp \
    clucene/CLucene/index/SegmentMergeInfo.cpp \
    clucene/CLucene/index/SegmentMergeQueue.cpp \
    clucene/CLucene/index/SegmentMerger.cpp \
    clucene/CLucene/index/SegmentReader.cpp \
    clucene/CLucene/index/SegmentTermDocs.cpp \
    clucene/CLucene/index/SegmentTermEnum.cpp \
    clucene/CLucene/index/SegmentTermPositions.cpp \
    clucene/CLucene/index/SegmentTermVector.cpp \
    clucene/CLucene/index/SkipListReader.cpp \
    clucene/CLucene/index/SkipListWriter.cpp \
    clucene/CLucene/index/Term.cpp \
    clucene/CLucene/index/TermInfo.cpp \
    clucene/CLucene/index/TermInfosReader.cpp \
    clucene/CLucene/index/TermInfosWriter.cpp \
    clucene/CLucene/index/Terms.cpp \
    clucene/CLucene/index/TermVectorReader.cpp \
    clucene/CLucene/index/TermVectorWriter.cpp \
    clucene/CLucene/queryParser/FastCharStream.cpp \
    clucene/CLucene/queryParser/MultiFieldQueryParser.cpp \
    clucene/CLucene/queryParser/QueryParser.cpp \
    clucene/CLucene/queryParser/QueryParserTokenManager.cpp \
    clucene/CLucene/queryParser/QueryToken.cpp \
    clucene/CLucene/search/spans/NearSpansOrdered.cpp \
    clucene/CLucene/search/spans/NearSpansUnordered.cpp \
    clucene/CLucene/search/spans/SpanFirstQuery.cpp \
    clucene/CLucene/search/spans/SpanNearQuery.cpp \
    clucene/CLucene/search/spans/SpanNotQuery.cpp \
    clucene/CLucene/search/spans/SpanOrQuery.cpp \
    clucene/CLucene/search/spans/SpanScorer.cpp \
    clucene/CLucene/search/spans/SpanTermQuery.cpp \
    clucene/CLucene/search/spans/SpanWeight.cpp \
    clucene/CLucene/search/spans/TermSpans.cpp \
    clucene/CLucene/search/BooleanQuery.cpp \
    clucene/CLucene/search/BooleanScorer.cpp \
    clucene/CLucene/search/BooleanScorer2.cpp \
    clucene/CLucene/search/CachingSpanFilter.cpp \
    clucene/CLucene/search/CachingWrapperFilter.cpp \
    clucene/CLucene/search/ChainedFilter.cpp \
    clucene/CLucene/search/Compare.cpp \
    clucene/CLucene/search/ConjunctionScorer.cpp \
    clucene/CLucene/search/ConstantScoreQuery.cpp \
    clucene/CLucene/search/DateFilter.cpp \
    clucene/CLucene/search/DisjunctionSumScorer.cpp \
    clucene/CLucene/search/ExactPhraseScorer.cpp \
    clucene/CLucene/search/Explanation.cpp \
    clucene/CLucene/search/FieldCache.cpp \
    clucene/CLucene/search/FieldCacheImpl.cpp \
    clucene/CLucene/search/FieldDocSortedHitQueue.cpp \
    clucene/CLucene/search/FieldSortedHitQueue.cpp \
    clucene/CLucene/search/FilteredTermEnum.cpp \
    clucene/CLucene/search/FuzzyQuery.cpp \
    clucene/CLucene/search/HitQueue.cpp \
    clucene/CLucene/search/Hits.cpp \
    clucene/CLucene/search/IndexSearcher.cpp \
    clucene/CLucene/search/MatchAllDocsQuery.cpp \
    clucene/CLucene/search/MultiPhraseQuery.cpp \
    clucene/CLucene/search/MultiSearcher.cpp \
    clucene/CLucene/search/MultiTermQuery.cpp \
    clucene/CLucene/search/PhrasePositions.cpp \
    clucene/CLucene/search/PhraseQuery.cpp \
    clucene/CLucene/search/PhraseScorer.cpp \
    clucene/CLucene/search/PrefixQuery.cpp \
    clucene/CLucene/search/QueryFilter.cpp \
    clucene/CLucene/search/RangeFilter.cpp \
    clucene/CLucene/search/RangeQuery.cpp \
    clucene/CLucene/search/Scorer.cpp \
    clucene/CLucene/search/ScorerDocQueue.cpp \
    clucene/CLucene/search/SearchHeader.cpp \
    clucene/CLucene/search/Similarity.cpp \
    clucene/CLucene/search/SloppyPhraseScorer.cpp \
    clucene/CLucene/search/Sort.cpp \
    clucene/CLucene/search/SpanQueryFilter.cpp \
    clucene/CLucene/search/TermQuery.cpp \
    clucene/CLucene/search/TermScorer.cpp \
    clucene/CLucene/search/WildcardQuery.cpp \
    clucene/CLucene/search/WildcardTermEnum.cpp \
    clucene/CLucene/store/Directory.cpp \
    clucene/CLucene/store/FSDirectory.cpp \
    clucene/CLucene/store/IndexInput.cpp \
    clucene/CLucene/store/IndexOutput.cpp \
    clucene/CLucene/store/Lock.cpp \
    clucene/CLucene/store/LockFactory.cpp \
    clucene/CLucene/store/MMapInput.cpp \
    clucene/CLucene/store/RAMDirectory.cpp \
    clucene/CLucene/util/BitSet.cpp \
    clucene/CLucene/util/deflate.cpp \
    clucene/CLucene/util/dirent.cpp \
    clucene/CLucene/util/Equators.cpp \
    clucene/CLucene/util/FastCharStream_util.cpp \
    clucene/CLucene/util/MD5Digester.cpp \
    clucene/CLucene/util/Misc.cpp \
    clucene/CLucene/util/Reader.cpp \
    clucene/CLucene/util/StringBuffer.cpp \
    clucene/CLucene/util/StringIntern.cpp \
    clucene/CLucene/util/ThreadLocal.cpp \
    clucene/CLucene/SharedHeader.cpp \
    clucene/CLucene/StdHeader.cpp \
    clucene/CLucene/config/threads.cpp \
    str.cpp \
    wsearchresultmodel.cpp \
    indexer/indexer.cpp \
    indexer/indexerthread.cpp \
    indexer/indexerworker.cpp \
    indexer/jvm.cpp \
    lucy/lucy.cpp \
    lucy/lucyindexer.cpp \
    lucy/lucysearcher.cpp \
    searcher/searcher.cpp \
    clucene-contrib-lib/CLucene/analysis/cjk/CJKAnalyzer.cpp \
    clucene-contrib-lib/CLucene/analysis/de/GermanAnalyzer.cpp \
    clucene-contrib-lib/CLucene/analysis/de/GermanStemFilter.cpp \
    clucene-contrib-lib/CLucene/analysis/de/GermanStemmer.cpp \
    clucene-contrib-lib/CLucene/analysis/LanguageBasedAnalyzer.cpp \
    #clucene-contrib-lib/CLucene/analysis/PorterStemmer.cpp \
    clucene-contrib-lib/CLucene/highlighter/Encoder.cpp \
    clucene-contrib-lib/CLucene/highlighter/Formatter.cpp \
    clucene-contrib-lib/CLucene/highlighter/Fragmenter.cpp \
    clucene-contrib-lib/CLucene/highlighter/Highlighter.cpp \
    clucene-contrib-lib/CLucene/highlighter/QueryScorer.cpp \
    clucene-contrib-lib/CLucene/highlighter/QueryTermExtractor.cpp \
    clucene-contrib-lib/CLucene/highlighter/SimpleFragmenter.cpp \
    clucene-contrib-lib/CLucene/highlighter/SimpleHTMLEncoder.cpp \
    clucene-contrib-lib/CLucene/highlighter/SimpleHTMLFormatter.cpp \
    clucene-contrib-lib/CLucene/highlighter/TextFragment.cpp \
    clucene-contrib-lib/CLucene/highlighter/TokenGroup.cpp \
    clucene-contrib-lib/CLucene/highlighter/TokenSources.cpp \
    clucene-contrib-lib/CLucene/highlighter/WeightedTerm.cpp \
    clucene-contrib-lib/CLucene/snowball/Snowball.cpp \
    clucene-contrib-lib/CLucene/util/gzipcompressstream.cpp \
    clucene-contrib-lib/CLucene/util/gzipinputstream.cpp \
    clucene-contrib-lib/CLucene/snowball/libstemmer/libstemmer.c \
    clucene-contrib-lib/CLucene/snowball/runtime/api.c \
    clucene-contrib-lib/CLucene/snowball/runtime/utilities.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_danish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_dutch.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_english.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_finnish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_french.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_german.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_italian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_norwegian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_porter.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_portuguese.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_spanish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_swedish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_KOI8_R_russian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_danish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_dutch.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_english.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_finnish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_french.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_german.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_italian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_norwegian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_porter.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_portuguese.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_russian.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_spanish.c \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_swedish.c \
    searcher/seacherHighlightFormatter.cpp \
    searcher/wsearchitemdelegate.cpp

HEADERS  += mainwindow.h \
    wsearch.h \
    wsettings.h \
    res.rc \
    resource.h \
    cfg.h \
    emitter.h \
    logger.h \
    logwnd.h \
    zlib/crc32.h \
    zlib/deflate.h \
    zlib/inffast.h \
    zlib/inffixed.h \
    zlib/inflate.h \
    zlib/inftrees.h \
    zlib/trees.h \
    zlib/zconf.h \
    zlib/zlib.h \
    zlib/zutil.h \
    boost/config/abi/borland_prefix.hpp \
    boost/config/abi/borland_suffix.hpp \
    boost/config/abi/msvc_prefix.hpp \
    boost/config/abi/msvc_suffix.hpp \
    boost/config/compiler/borland.hpp \
    boost/config/compiler/codegear.hpp \
    boost/config/compiler/comeau.hpp \
    boost/config/compiler/common_edg.hpp \
    boost/config/compiler/compaq_cxx.hpp \
    boost/config/compiler/digitalmars.hpp \
    boost/config/compiler/gcc.hpp \
    boost/config/compiler/gcc_xml.hpp \
    boost/config/compiler/greenhills.hpp \
    boost/config/compiler/hp_acc.hpp \
    boost/config/compiler/intel.hpp \
    boost/config/compiler/kai.hpp \
    boost/config/compiler/metrowerks.hpp \
    boost/config/compiler/mpw.hpp \
    boost/config/compiler/pgi.hpp \
    boost/config/compiler/sgi_mipspro.hpp \
    boost/config/compiler/sunpro_cc.hpp \
    boost/config/compiler/vacpp.hpp \
    boost/config/compiler/visualc.hpp \
    boost/config/no_tr1/cmath.hpp \
    boost/config/no_tr1/complex.hpp \
    boost/config/no_tr1/functional.hpp \
    boost/config/no_tr1/memory.hpp \
    boost/config/no_tr1/utility.hpp \
    boost/config/platform/aix.hpp \
    boost/config/platform/amigaos.hpp \
    boost/config/platform/beos.hpp \
    boost/config/platform/bsd.hpp \
    boost/config/platform/cygwin.hpp \
    boost/config/platform/hpux.hpp \
    boost/config/platform/irix.hpp \
    boost/config/platform/linux.hpp \
    boost/config/platform/macos.hpp \
    boost/config/platform/qnxnto.hpp \
    boost/config/platform/solaris.hpp \
    boost/config/platform/vxworks.hpp \
    boost/config/platform/win32.hpp \
    boost/config/stdlib/dinkumware.hpp \
    boost/config/stdlib/libcomo.hpp \
    boost/config/stdlib/libstdcpp3.hpp \
    boost/config/stdlib/modena.hpp \
    boost/config/stdlib/msl.hpp \
    boost/config/stdlib/roguewave.hpp \
    boost/config/stdlib/sgi.hpp \
    boost/config/stdlib/stlport.hpp \
    boost/config/stdlib/vacpp.hpp \
    boost/config/abi_prefix.hpp \
    boost/config/abi_suffix.hpp \
    boost/config/auto_link.hpp \
    boost/config/posix_features.hpp \
    boost/config/requires_threads.hpp \
    boost/config/select_compiler_config.hpp \
    boost/config/select_platform_config.hpp \
    boost/config/select_stdlib_config.hpp \
    boost/config/suffix.hpp \
    boost/config/user.hpp \
    boost/config/warning_disable.hpp \
    boost/detail/algorithm.hpp \
    boost/detail/allocator_utilities.hpp \
    boost/detail/atomic_count.hpp \
    boost/detail/binary_search.hpp \
    boost/detail/call_traits.hpp \
    boost/detail/catch_exceptions.hpp \
    boost/detail/compressed_pair.hpp \
    boost/detail/container_fwd.hpp \
    boost/detail/dynamic_bitset.hpp \
    boost/detail/endian.hpp \
    boost/detail/has_default_constructor.hpp \
    boost/detail/identifier.hpp \
    boost/detail/indirect_traits.hpp \
    boost/detail/interlocked.hpp \
    boost/detail/is_function_ref_tester.hpp \
    boost/detail/is_incrementable.hpp \
    boost/detail/is_xxx.hpp \
    boost/detail/iterator.hpp \
    boost/detail/lcast_precision.hpp \
    boost/detail/lightweight_mutex.hpp \
    boost/detail/lightweight_test.hpp \
    boost/detail/lightweight_thread.hpp \
    boost/detail/limits.hpp \
    boost/detail/named_template_params.hpp \
    boost/detail/no_exceptions_support.hpp \
    boost/detail/none_t.hpp \
    boost/detail/numeric_traits.hpp \
    boost/detail/ob_call_traits.hpp \
    boost/detail/ob_compressed_pair.hpp \
    boost/detail/quick_allocator.hpp \
    boost/detail/reference_content.hpp \
    boost/detail/scoped_enum_emulation.hpp \
    boost/detail/select_type.hpp \
    boost/detail/sp_typeinfo.hpp \
    boost/detail/templated_streams.hpp \
    boost/detail/utf8_codecvt_facet.hpp \
    boost/detail/workaround.hpp \
    boost/exception/detail/attribute_noreturn.hpp \
    boost/exception/detail/error_info_impl.hpp \
    boost/exception/detail/exception_ptr.hpp \
    boost/exception/detail/is_output_streamable.hpp \
    boost/exception/detail/object_hex_dump.hpp \
    boost/exception/detail/type_info.hpp \
    boost/exception/all.hpp \
    boost/exception/current_exception_cast.hpp \
    boost/exception/diagnostic_information.hpp \
    boost/exception/enable_current_exception.hpp \
    boost/exception/enable_error_info.hpp \
    boost/exception/errinfo_api_function.hpp \
    boost/exception/errinfo_at_line.hpp \
    boost/exception/errinfo_errno.hpp \
    boost/exception/errinfo_file_handle.hpp \
    boost/exception/errinfo_file_name.hpp \
    boost/exception/errinfo_file_open_mode.hpp \
    boost/exception/errinfo_nested_exception.hpp \
    boost/exception/errinfo_type_info_name.hpp \
    boost/exception/error_info.hpp \
    boost/exception/exception.hpp \
    boost/exception/get_error_info.hpp \
    boost/exception/info.hpp \
    boost/exception/info_tuple.hpp \
    boost/exception/to_string.hpp \
    boost/exception/to_string_stub.hpp \
    boost/smart_ptr/detail/atomic_count.hpp \
    boost/smart_ptr/detail/atomic_count_gcc.hpp \
    boost/smart_ptr/detail/atomic_count_gcc_x86.hpp \
    boost/smart_ptr/detail/atomic_count_pthreads.hpp \
    boost/smart_ptr/detail/atomic_count_solaris.hpp \
    boost/smart_ptr/detail/atomic_count_sync.hpp \
    boost/smart_ptr/detail/atomic_count_win32.hpp \
    boost/smart_ptr/detail/lightweight_mutex.hpp \
    boost/smart_ptr/detail/lwm_nop.hpp \
    boost/smart_ptr/detail/lwm_pthreads.hpp \
    boost/smart_ptr/detail/lwm_win32_cs.hpp \
    boost/smart_ptr/detail/operator_bool.hpp \
    boost/smart_ptr/detail/quick_allocator.hpp \
    boost/smart_ptr/detail/shared_array_nmt.hpp \
    boost/smart_ptr/detail/shared_count.hpp \
    boost/smart_ptr/detail/shared_ptr_nmt.hpp \
    boost/smart_ptr/detail/sp_convertible.hpp \
    boost/smart_ptr/detail/sp_counted_base.hpp \
    boost/smart_ptr/detail/sp_counted_base_acc_ia64.hpp \
    boost/smart_ptr/detail/sp_counted_base_cw_ppc.hpp \
    boost/smart_ptr/detail/sp_counted_base_cw_x86.hpp \
    boost/smart_ptr/detail/sp_counted_base_gcc_ia64.hpp \
    boost/smart_ptr/detail/sp_counted_base_gcc_mips.hpp \
    boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp \
    boost/smart_ptr/detail/sp_counted_base_gcc_sparc.hpp \
    boost/smart_ptr/detail/sp_counted_base_gcc_x86.hpp \
    boost/smart_ptr/detail/sp_counted_base_nt.hpp \
    boost/smart_ptr/detail/sp_counted_base_pt.hpp \
    boost/smart_ptr/detail/sp_counted_base_solaris.hpp \
    boost/smart_ptr/detail/sp_counted_base_spin.hpp \
    boost/smart_ptr/detail/sp_counted_base_sync.hpp \
    boost/smart_ptr/detail/sp_counted_base_w32.hpp \
    boost/smart_ptr/detail/sp_counted_impl.hpp \
    boost/smart_ptr/detail/sp_has_sync.hpp \
    boost/smart_ptr/detail/spinlock.hpp \
    boost/smart_ptr/detail/spinlock_gcc_arm.hpp \
    boost/smart_ptr/detail/spinlock_nt.hpp \
    boost/smart_ptr/detail/spinlock_pool.hpp \
    boost/smart_ptr/detail/spinlock_pt.hpp \
    boost/smart_ptr/detail/spinlock_sync.hpp \
    boost/smart_ptr/detail/spinlock_w32.hpp \
    boost/smart_ptr/detail/yield_k.hpp \
    boost/smart_ptr/bad_weak_ptr.hpp \
    boost/smart_ptr/enable_shared_from_this.hpp \
    boost/smart_ptr/enable_shared_from_this2.hpp \
    boost/smart_ptr/intrusive_ptr.hpp \
    boost/smart_ptr/make_shared.hpp \
    boost/smart_ptr/scoped_array.hpp \
    boost/smart_ptr/scoped_ptr.hpp \
    boost/smart_ptr/shared_array.hpp \
    boost/smart_ptr/shared_ptr.hpp \
    boost/smart_ptr/weak_ptr.hpp \
    boost/assert.hpp \
    boost/checked_delete.hpp \
    boost/config.hpp \
    boost/current_function.hpp \
    boost/memory_order.hpp \
    boost/shared_ptr.hpp \
    boost/throw_exception.hpp \
    boost/version.hpp \
    clucene/CLucene/analysis/standard/StandardAnalyzer.h \
    clucene/CLucene/analysis/standard/StandardFilter.h \
    clucene/CLucene/analysis/standard/StandardTokenizer.h \
    clucene/CLucene/analysis/standard/StandardTokenizerConstants.h \
    clucene/CLucene/analysis/AnalysisHeader.h \
    clucene/CLucene/analysis/Analyzers.h \
    clucene/CLucene/analysis/CachingTokenFilter.h \
    clucene/CLucene/config/_gunichartables.h \
    clucene/CLucene/config/repl_tchar.h \
    clucene/CLucene/config/repl_wchar.h \
    clucene/CLucene/config/repl_wctype.h \
    clucene/CLucene/debug/_condition.h \
    clucene/CLucene/debug/error.h \
    clucene/CLucene/debug/lucenebase.h \
    clucene/CLucene/debug/mem.h \
    clucene/CLucene/document/DateField.h \
    clucene/CLucene/document/DateTools.h \
    clucene/CLucene/document/Document.h \
    clucene/CLucene/document/Field.h \
    clucene/CLucene/document/FieldSelector.h \
    clucene/CLucene/document/NumberTools.h \
    clucene/CLucene/index/_CompoundFile.h \
    clucene/CLucene/index/_DocumentsWriter.h \
    clucene/CLucene/index/_FieldInfo.h \
    clucene/CLucene/index/_FieldInfos.h \
    clucene/CLucene/index/_FieldsReader.h \
    clucene/CLucene/index/_FieldsWriter.h \
    clucene/CLucene/index/_IndexFileDeleter.h \
    clucene/CLucene/index/_IndexFileNameFilter.h \
    clucene/CLucene/index/_IndexFileNames.h \
    clucene/CLucene/index/_MultiSegmentReader.h \
    clucene/CLucene/index/_SegmentHeader.h \
    clucene/CLucene/index/_SegmentInfos.h \
    clucene/CLucene/index/_SegmentMergeInfo.h \
    clucene/CLucene/index/_SegmentMergeQueue.h \
    clucene/CLucene/index/_SegmentMerger.h \
    clucene/CLucene/index/_SegmentTermEnum.h \
    clucene/CLucene/index/_SkipListReader.h \
    clucene/CLucene/index/_SkipListWriter.h \
    clucene/CLucene/index/_Term.h \
    clucene/CLucene/index/_TermInfo.h \
    clucene/CLucene/index/_TermInfosReader.h \
    clucene/CLucene/index/_TermInfosWriter.h \
    clucene/CLucene/index/_TermVector.h \
    clucene/CLucene/index/DirectoryIndexReader.h \
    clucene/CLucene/index/IndexDeletionPolicy.h \
    clucene/CLucene/index/IndexModifier.h \
    clucene/CLucene/index/IndexReader.h \
    clucene/CLucene/index/IndexWriter.h \
    clucene/CLucene/index/MergePolicy.h \
    clucene/CLucene/index/MergeScheduler.h \
    clucene/CLucene/index/MultipleTermPositions.h \
    clucene/CLucene/index/MultiReader.h \
    clucene/CLucene/index/Payload.h \
    clucene/CLucene/index/Term.h \
    clucene/CLucene/index/Terms.h \
    clucene/CLucene/index/TermVector.h \
    clucene/CLucene/queryParser/_CharStream.h \
    clucene/CLucene/queryParser/_FastCharStream.h \
    clucene/CLucene/queryParser/MultiFieldQueryParser.h \
    clucene/CLucene/queryParser/QueryParser.h \
    clucene/CLucene/queryParser/QueryParserConstants.h \
    clucene/CLucene/queryParser/QueryParserTokenManager.h \
    clucene/CLucene/queryParser/QueryToken.h \
    clucene/CLucene/search/spans/_EmptySpans.h \
    clucene/CLucene/search/spans/_NearSpansOrdered.h \
    clucene/CLucene/search/spans/_TermSpans.h \
    clucene/CLucene/search/spans/SpanFirstQuery.h \
    clucene/CLucene/search/spans/SpanNearQuery.h \
    clucene/CLucene/search/spans/SpanNotQuery.h \
    clucene/CLucene/search/spans/SpanOrQuery.h \
    clucene/CLucene/search/spans/SpanQuery.h \
    clucene/CLucene/search/spans/Spans.h \
    clucene/CLucene/search/spans/SpanScorer.h \
    clucene/CLucene/search/spans/SpanTermQuery.h \
    clucene/CLucene/search/spans/SpanWeight.h \
    clucene/CLucene/search/_BooleanScorer.h \
    clucene/CLucene/search/_BooleanScorer2.h \
    clucene/CLucene/search/_ConjunctionScorer.h \
    clucene/CLucene/search/_DisjunctionSumScorer.h \
    clucene/CLucene/search/_ExactPhraseScorer.h \
    clucene/CLucene/search/_FieldCacheImpl.h \
    clucene/CLucene/search/_FieldDocSortedHitQueue.h \
    clucene/CLucene/search/_HitQueue.h \
    clucene/CLucene/search/_PhrasePositions.h \
    clucene/CLucene/search/_PhraseQueue.h \
    clucene/CLucene/search/_PhraseScorer.h \
    clucene/CLucene/search/_SloppyPhraseScorer.h \
    clucene/CLucene/search/_TermScorer.h \
    clucene/CLucene/search/BooleanClause.h \
    clucene/CLucene/search/BooleanQuery.h \
    clucene/CLucene/search/CachingSpanFilter.h \
    clucene/CLucene/search/CachingWrapperFilter.h \
    clucene/CLucene/search/ChainedFilter.h \
    clucene/CLucene/search/Compare.h \
    clucene/CLucene/search/ConstantScoreQuery.h \
    clucene/CLucene/search/DateFilter.h \
    clucene/CLucene/search/Explanation.h \
    clucene/CLucene/search/FieldCache.h \
    clucene/CLucene/search/FieldDoc.h \
    clucene/CLucene/search/FieldSortedHitQueue.h \
    clucene/CLucene/search/Filter.h \
    clucene/CLucene/search/FilteredTermEnum.h \
    clucene/CLucene/search/FilterResultCache.h \
    clucene/CLucene/search/FuzzyQuery.h \
    clucene/CLucene/search/Hits.h \
    clucene/CLucene/search/IndexSearcher.h \
    clucene/CLucene/search/MatchAllDocsQuery.h \
    clucene/CLucene/search/MultiPhraseQuery.h \
    clucene/CLucene/search/MultiSearcher.h \
    clucene/CLucene/search/MultiTermQuery.h \
    clucene/CLucene/search/PhraseQuery.h \
    clucene/CLucene/search/PrefixQuery.h \
    clucene/CLucene/search/Query.h \
    clucene/CLucene/search/QueryFilter.h \
    clucene/CLucene/search/RangeFilter.h \
    clucene/CLucene/search/RangeQuery.h \
    clucene/CLucene/search/Scorer.h \
    clucene/CLucene/search/ScorerDocQueue.h \
    clucene/CLucene/search/Searchable.h \
    clucene/CLucene/search/SearchHeader.h \
    clucene/CLucene/search/Similarity.h \
    clucene/CLucene/search/Sort.h \
    clucene/CLucene/search/SpanFilter.h \
    clucene/CLucene/search/SpanFilterResult.h \
    clucene/CLucene/search/SpanQueryFilter.h \
    clucene/CLucene/search/TermQuery.h \
    clucene/CLucene/search/WildcardQuery.h \
    clucene/CLucene/search/WildcardTermEnum.h \
    clucene/CLucene/store/_Lock.h \
    clucene/CLucene/store/_MMapIndexInput.h \
    clucene/CLucene/store/_RAMDirectory.h \
    clucene/CLucene/store/Directory.h \
    clucene/CLucene/store/FSDirectory.h \
    clucene/CLucene/store/IndexInput.h \
    clucene/CLucene/store/IndexOutput.h \
    clucene/CLucene/store/Lock.h \
    clucene/CLucene/store/LockFactory.h \
    clucene/CLucene/store/RAMDirectory.h \
    clucene/CLucene/util/_Arrays.h \
    clucene/CLucene/util/_bufferedstream.h \
    clucene/CLucene/util/_FastCharStream.h \
    clucene/CLucene/util/_MD5Digester.h \
    clucene/CLucene/util/_streambase.h \
    clucene/CLucene/util/_streambuffer.h \
    clucene/CLucene/util/_StringIntern.h \
    clucene/CLucene/util/_ThreadLocal.h \
    clucene/CLucene/util/_VoidList.h \
    clucene/CLucene/util/_VoidMap.h \
    clucene/CLucene/util/Array.h \
    clucene/CLucene/util/BitSet.h \
    clucene/CLucene/util/CLStreams.h \
    clucene/CLucene/util/dirent.h \
    clucene/CLucene/util/Equators.h \
    clucene/CLucene/util/Misc.h \
    clucene/CLucene/util/PriorityQueue.h \
    clucene/CLucene/util/Reader.h \
    clucene/CLucene/util/StringBuffer.h \
    clucene/CLucene/util/VoidList.h \
    clucene/CLucene/util/VoidMap.h \
    clucene/CLucene/_ApiHeader.h \
    clucene/CLucene/_SharedHeader.h \
    clucene/CLucene/CLConfig.h \
    clucene/CLucene/LuceneThreads.h \
    clucene/CLucene/SharedHeader.h \
    clucene/CLucene/StdHeader.h \
    clucene/CLucene.h \
    str.h \
    wsearchresultmodel.h \
    indexer/indexer.h \
    indexer/indexerthread.h \
    indexer/indexerworker.h \
    indexer/jvm.h \
    lucy/lucy.h \
    lucy/lucyindexer.h \
    lucy/lucysearcher.h \
    searcher/searcher.h \
    clucene-contrib-lib/CLucene/analysis/cjk/CJKAnalyzer.h \
    clucene-contrib-lib/CLucene/analysis/de/GermanAnalyzer.h \
    clucene-contrib-lib/CLucene/analysis/de/GermanStemFilter.h \
    clucene-contrib-lib/CLucene/analysis/de/GermanStemmer.h \
    clucene-contrib-lib/CLucene/analysis/LanguageBasedAnalyzer.h \
    #clucene-contrib-lib/CLucene/analysis/PorterStemmer.h \
    clucene-contrib-lib/CLucene/highlighter/Encoder.h \
    clucene-contrib-lib/CLucene/highlighter/Formatter.h \
    clucene-contrib-lib/CLucene/highlighter/Fragmenter.h \
    clucene-contrib-lib/CLucene/highlighter/Highlighter.h \
    clucene-contrib-lib/CLucene/highlighter/HighlightScorer.h \
    clucene-contrib-lib/CLucene/highlighter/QueryScorer.h \
    clucene-contrib-lib/CLucene/highlighter/QueryTermExtractor.h \
    clucene-contrib-lib/CLucene/highlighter/Scorer.h \
    clucene-contrib-lib/CLucene/highlighter/SimpleFragmenter.h \
    clucene-contrib-lib/CLucene/highlighter/SimpleHTMLEncoder.h \
    clucene-contrib-lib/CLucene/highlighter/SimpleHTMLFormatter.h \
    clucene-contrib-lib/CLucene/highlighter/TextFragment.h \
    clucene-contrib-lib/CLucene/highlighter/TokenGroup.h \
    clucene-contrib-lib/CLucene/highlighter/TokenSources.h \
    clucene-contrib-lib/CLucene/highlighter/WeightedTerm.h \
    clucene-contrib-lib/CLucene/snowball/include/libstemmer.h \
    clucene-contrib-lib/CLucene/snowball/libstemmer/modules.h \
    clucene-contrib-lib/CLucene/snowball/runtime/api.h \
    clucene-contrib-lib/CLucene/snowball/runtime/header.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_danish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_dutch.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_english.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_finnish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_french.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_german.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_italian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_norwegian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_porter.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_portuguese.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_spanish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_ISO_8859_1_swedish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_KOI8_R_russian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_danish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_dutch.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_english.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_finnish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_french.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_german.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_italian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_norwegian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_porter.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_portuguese.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_russian.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_spanish.h \
    clucene-contrib-lib/CLucene/snowball/src_c/stem_UTF_8_swedish.h \
    clucene-contrib-lib/CLucene/snowball/libstemmer.h \
    clucene-contrib-lib/CLucene/snowball/SnowballAnalyzer.h \
    clucene-contrib-lib/CLucene/snowball/SnowballFilter.h \
    clucene-contrib-lib/CLucene/util/arrayinputstream.h \
    clucene-contrib-lib/CLucene/util/byteinputstream.h \
    clucene-contrib-lib/CLucene/util/gzipcompressstream.h \
    clucene-contrib-lib/CLucene/util/gzipinputstream.h \
    clucene-contrib-lib/CLucene/util/streamarray.h \
    searcher/seacherHighlightFormatter.h \
    globalinclude.h \
    searcher/wsearchitemdelegate.h

FORMS    += mainwindow.ui \
    wsearch.ui \
    wsettings.ui

RESOURCES += \
    res.qrc

DISTFILES += ico.ico \
    zlib/algorithm.txt \
    clucene/clucene-core-2.3.3.4.- \
    clucene-contrib-lib/CLucene/snowball/snowball.version

RC_FILE = res.rc

INCLUDEPATH += ./lucy
INCLUDEPATH += ./indexer
INCLUDEPATH += ./searcher

INCLUDEPATH += ./java/include/win32
INCLUDEPATH += ./clucene
INCLUDEPATH += ./clucene-contrib-lib
INCLUDEPATH += ./zlib
INCLUDEPATH += ./boost
