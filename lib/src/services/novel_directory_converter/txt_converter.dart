import 'package:flutter/foundation.dart';
import 'package:novel_reader/src/models/novel.dart';

import 'package:novel_reader/src/models/novel_directory.dart';

import '../../helpers/lock.dart';
import '../file/io_reader.dart';
import 'converter_typed_interface.dart';

class TxtConverter extends ConverterTyped {
  @override
  Future<List<NovelChapter>> convert(Novel novel) async {
    final novelDirectories = <NovelChapter>[];
    if (kIsWeb) {
    } else {
      final lock = Lock();
      lock.lock();

      int chapterStartPosition = -1;
      String chapterTitle = '序章';
      String? volumeTitle;
      IOReader(novel).readLines().forEach((element) {
        if (element.lineContent.isNotEmpty != true) {
          return;
        }
        final volumeRegex = RegExp(r'\s?第{1}.*卷{1}\s?');
        final volumeMatch = volumeRegex.allMatches(element.lineContent);

        final chapterRegex = RegExp(r'\s+第{1}.*章{1}\s?');
        final chapterMatch = chapterRegex.allMatches(element.lineContent);

        if (chapterMatch.isNotEmpty == true) {

          novelDirectories.add(NovelChapter(
              volume: volumeTitle,
              title: chapterTitle,
              startCharIndex:
                  chapterStartPosition == -1 ? 0 : chapterStartPosition,
              endCharIndex: element.lineStartPosition - 1));
          chapterTitle = chapterMatch.first.group(0) ?? '';

          //下一章开始位置
          chapterStartPosition = element.lineStartPosition;
        }

        if (volumeMatch.isNotEmpty == true) {
          volumeTitle = volumeMatch.first.group(0);
        }
      }).whenComplete(() {
        novelDirectories.add(NovelChapter(
          title: '',
          startCharIndex: chapterStartPosition == -1 ? 0 : chapterStartPosition,
        ));
        lock.unlock();
      });
      await lock.waitDone();
    }
    return novelDirectories;
  }
}
