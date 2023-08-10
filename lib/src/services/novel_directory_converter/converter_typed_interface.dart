import '../../models/novel.dart';
import '../../models/novel_directory.dart';

abstract class ConverterTyped {
  Future<List<NovelChapter>> convertChapters(Novel novel);

  Future<List<NovelChapter>> findChapterPositions(Novel novel,List<NovelChapter> chapters);
}
