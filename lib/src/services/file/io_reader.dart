import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../../models/novel.dart';

class IOReader {
  const IOReader(this._novel);

  final Novel _novel;

  Future<Uint8List> readBuffer() {
    return File(_novel.filePath!).readAsBytes();
  }

  Future<String> readString() async {
    return await File(_novel.filePath!).readAsString();
  }

  Stream<LineBuffer> readLines() async* {
    final file = await File(_novel.filePath!).open();

    int lineStartPosition = 0;
    final List<int> bytes = [];
    while (true) {
      final byte = await file.readByte();
      if (byte == -1) {
        //到达文件末尾
        if (bytes.isNotEmpty) {
          yield LineBuffer(
              lineContent: utf8.decode(bytes),
              lineStartPosition: lineStartPosition,
              lineEndPosition: lineStartPosition += bytes.length);
        }
        break;
      }
      if (byte == 10) {
        yield LineBuffer(
            lineContent: utf8.decode(bytes),
            lineStartPosition: lineStartPosition,
            lineEndPosition: lineStartPosition += bytes.length + 1);
        bytes.clear();
      } else {
        bytes.add(byte);
      }
    }
  }

  Stream<LineBuffer> findBufferPosition(List<String> titles) {
    return Stream.fromIterable(findBufferPositionByTitle(
        File(_novel.filePath!).readAsBytesSync(), titles));
  }

  /// 通过行分段返回每段的位置(buffer.position)
  ///  静态方法给多线程调用备用
  static List<LineBuffer> findBufferPositionByTitle(
      Uint8List buffer, List<String> lines,
      {CompairCallback? compair}) {
    compair ??= _defaultCompair;

    final List<LineBuffer> result = [];
    //游标
    int currentPosition = 0;
    //记录一段返回位置
    int lastPosition = -1;
    //预留line
    String preline = '';

    (String, int) getLineContent() {
      final line =
          buffer.sublist(currentPosition, buffer.indexOf(10, currentPosition));
      return (utf8.decode(line), line.length);
    }

    //匹配到的行数
    int feedback = 0;
    while (true) {
      final (line, charLength) = getLineContent();
      if (compair.call(line, lines)) {
        feedback++;
        if (currentPosition != 0) {
          result.add(LineBuffer(
            lineContent: preline,
            lineStartPosition: lastPosition == -1 ? 0 : lastPosition,
            lineEndPosition: currentPosition - 1,
          ));
        }
        //匹配到一行
        lastPosition = currentPosition;
        preline = line;
      }

      //游标移动到下一行
      currentPosition += charLength + 1;

      ///所有行已经找到  || 到达文件末尾
      if (feedback == lines.length || currentPosition >= buffer.length) {
        result.add(LineBuffer(
            lineContent: line,
            lineStartPosition: lastPosition,
            lineEndPosition: buffer.length - 1));
        break;
      }
    }
    return result;
  }

  Stream<String> read({required int start, required int? end}) {
    final file = File(_novel.filePath!);
    return file.openRead(start, end).transform(utf8.decoder);
  }
}

/// 比较回调
typedef CompairCallback = bool Function(String line, List<String> toPositions);

CompairCallback _defaultCompair = (String line, List<String> toPositions) =>
    toPositions.any((element) => line.contains(element));

class LineBuffer {
  const LineBuffer(
      {required this.lineContent,
      required this.lineStartPosition,
      required this.lineEndPosition});

  /// 行内容
  /// 不包括换行符
  final String? lineContent;

  final int lineStartPosition;

  final int lineEndPosition;

  @override
  String toString() {
    return 'LineBuffer{lineContent: $lineContent, lineStartPosition: $lineStartPosition, lineEndPosition: $lineEndPosition}';
  }
}
