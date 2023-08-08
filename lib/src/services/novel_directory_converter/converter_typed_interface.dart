
import '../../models/novel.dart';
import '../../models/novel_directory.dart';

abstract class ConverterTyped {
  Future<List<NovelChapter>> convert(Novel novel);
}
