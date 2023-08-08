import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/models/novel_file_type.dart';
import 'package:novel_reader/src/services/file/io_reader.dart';

void main() {
  test('io test', () async {
    final novel = Novel(
      novelId: '1',
      novelName: 'test',
      length: Int64(1),
      filePath: 'test/widget_test.dart',
      novelFileType: NovelFileType.TXT,
    );
    final reader = IOReader(novel);

    final List<LineBuffer> lines = [];
    reader.readLines().listen((event) {
      lines.add(event);
    });

    await Future.delayed(const Duration(seconds: 3));
    for (final line in lines) {
      reader
          .read(
              start: line.lineStartPosition.toInt(),
              end: line.lineEndPosition.toInt())
          .listen((event) {
        expect(event, '${line.lineContent}\n');
      });
    }

    await Future.delayed(const Duration(seconds: 1));
  });
}
