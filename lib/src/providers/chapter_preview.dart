import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/models/novel_directory.dart';
import 'package:novel_reader/src/services/file/io_reader.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../helpers/lock.dart';

part 'chapter_preview.g.dart';

@riverpod
Future<String> readChapterContent(
    ReadChapterContentRef ref, Novel novel, NovelChapter chapter) async {
  String result = '';
  final lock = Lock();
  await lock.lock();
  IOReader(novel)
      .read(start: chapter.startCharIndex, end: chapter.endCharIndex)
      .listen((event) {
    result = event;
  }, onDone: () {
    lock.unlock();
  });
  await lock.waitDone();
  return result;
}
