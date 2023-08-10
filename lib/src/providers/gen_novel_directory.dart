import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/novel.dart';
import '../models/novel_directory.dart';
import 'novel_directory_converter.dart';

part 'gen_novel_directory.g.dart';

@riverpod
Stream<List<NovelChapter>> analyzeChapters(AnalyzeChaptersRef ref,
    {required Novel novel}) async* {
  //根据小说类型获取解码器
  final converter =
      ref.read(getNovelDirectoryConverterProvider(novel.novelFileType));
  //解析章节
  final chapters = await converter.convertChapters(novel);
  yield chapters;

  //解析出章节位置(耗时)
  final chaptersPosition =
      await converter.findChapterPositions(novel, [...chapters]);
  yield chaptersPosition;
}
