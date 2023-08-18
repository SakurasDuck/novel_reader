import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:novel_reader/src/models/novel.dart';

import 'package:novel_reader/src/models/novel_directory.dart';

import '../file/io_reader.dart';
import 'converter_typed_interface.dart';

class TxtConverter extends ConverterTyped {
  @override
  Future<List<NovelChapter>> convertChapters(Novel novel) async {
    final novelDirectories = <NovelChapter>[];
    if (kIsWeb) {
    } else {
      //新开线程,直接用正则匹配全本,通过reg.groups获取章节名
      final content = await IOReader(novel).readString();
      return Isolate.run<List<NovelChapter>>(() => _analyzer(content));
    }
    return novelDirectories;
  }

  @override
  Future<List<NovelChapter>> findChapterPositions(
      Novel novel, List<NovelChapter> chapters) async {
    final novelDirectories = <NovelChapter>[];
    if (kIsWeb) {
    } else {
      //新开线程,直接用正则匹配全本,通过reg.groups获取章节名
      final content = await IOReader(novel).readBuffer();
      return Isolate.run<List<NovelChapter>>(
          () => _findPositions(content, [...chapters]));
    }
    return novelDirectories;
  }

  /// 通过正则匹配章节
  static List<NovelChapter> _analyzer(String novel) {
    final novelDirectories = <NovelChapter>[];
    final reg = RegExp(
        r'([^\r\n]*序章?\s?$)|(?<=[\r\n])(([^\r\n]*第[一二三四五六七八九十百千万\d]*卷[^\r\n]*)?|([^\r\n]*))(第[一二三四五六七八九十百千万\d]+章)[^\r\n]*$',
        multiLine: true);
    final matches = reg.allMatches(novel);

    for (final match in matches) {
      final matchStr = match.group(0) ?? '';
      //卷号,卷名,章名可能为空
      //章号一定不能为空
      String? volumeNumber;
      String? volumeName;
      String? chapterName;
      String chapterNumber = '';

      //通过不同的正则分析出卷名,卷号,章名,章号
      final volumeNumberReg = RegExp(r'第[一二三四五六七八九十百千万\d]*卷');
      final valumeNumberMatch = volumeNumberReg.firstMatch(matchStr);
      if (valumeNumberMatch != null) {
        volumeNumber = valumeNumberMatch.group(0);
      }
      final volumeNameReg = RegExp(
          r'(?<=第[一二三四五六七八九十百千万\d]*卷\s+).*(?=(\s+第[一二三四五六七八九十百千万\d]+章\s?))');
      final volumeNameMatch = volumeNameReg.firstMatch(matchStr);
      if (volumeNameMatch != null) {
        volumeName = volumeNameMatch.group(0);
      }
      final chapterNumberReg = RegExp(r'(第[一二三四五六七八九十百千万\d]+章)|(序章?)');
      final chapterNumberMatch = chapterNumberReg.firstMatch(matchStr);
      if (chapterNumberMatch != null) {
        chapterNumber = chapterNumberMatch.group(0) ?? matchStr;
      }
      final chapterNameReg = RegExp(r'(?<=第[一二三四五六七八九十百千万\d]+章\s+).*(?=\s?.*)');
      final chapterNameMatch = chapterNameReg.firstMatch(matchStr);
      if (chapterNameMatch != null) {
        chapterName = chapterNameMatch.group(0);
      }

      final chapter = NovelChapter(
        chapteLine: matchStr,
        volumeTitle: volumeName,
        volumeIndex: volumeNumber,
        chapterTitle: chapterName,
        chapterIndex: chapterNumber,
        startCharIndex: -1,
      );
      novelDirectories.add(chapter);
    }
    return novelDirectories;
  }

  /// 通过行返回每段的位置(buffer.position)
  static List<NovelChapter> _findPositions(
      Uint8List novelBuffer, List<NovelChapter> chapters) {
    final positons = IOReader.findBufferPositionByTitle(
        novelBuffer, chapters.map((e) => e.chapteLine).toList());
    assert(chapters.length <= positons.length);
    if (positons.isNotEmpty && positons[0].lineContent == '') {
      chapters.insert(
          0,
          const NovelChapter(
            chapteLine: '',
            chapterIndex: '序',
            startCharIndex: 0,
          ));
    }

    //直接假设章节顺序是正确的,不做排序
    for (var i = 0; i < chapters.length; i++) {
      if (positons.length > i) {
        final positon = positons[i];
        chapters[i] = chapters[i].copyWith(
          startCharIndex: positon.lineStartPosition,
          endCharIndex: positon.lineEndPosition,
        );
      }
    }
    return chapters;
  }
}
