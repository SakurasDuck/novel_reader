import 'dart:convert';
import 'dart:io';

import '../../models/novel.dart';

class IOReader {
  const IOReader(this._novel);

  final Novel _novel;

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

  Stream<String> read({required int start, required int? end}) {
    final file = File(_novel.filePath!);
    return file.openRead(start, end).transform(utf8.decoder);
  }
}

class LineBuffer {
  const LineBuffer(
      {required this.lineContent,
      required this.lineStartPosition,
      required this.lineEndPosition});

  /// 行内容
  /// 不包括换行符
  final String lineContent;

  final int lineStartPosition;

  final int lineEndPosition;

  @override
  String toString() {
    return 'LineBuffer{lineContent: $lineContent, lineStartPosition: $lineStartPosition, lineEndPosition: $lineEndPosition}';
  }
}
