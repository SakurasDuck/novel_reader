import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/novel.dart';
import '../models/novel_directory.dart';
import 'novel_directory_converter.dart';

part 'gen_novel_directory.g.dart';

@riverpod
Future<List<NovelChapter>> genNovelDirectories(GenNovelDirectoriesRef ref,
    {required Novel novel}) async {
  //根据小说类型获取解码器
  final converter =
      ref.read(getNovelDirectoryConverterProvider(novel.novelFileType));
  return converter.convert(novel);
}
