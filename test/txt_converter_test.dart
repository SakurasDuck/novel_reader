import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/models/novel_file_type.dart';
import 'package:novel_reader/src/services/file/io_reader.dart';
import 'package:novel_reader/src/services/novel_directory_converter/txt_converter.dart';

void main() {
  test('无法拆分', () async {
    final novel = Novel(
      novelId: '1',
      novelName: 'test',
      length: Int64(1),
      filePath: 'test/widget_test.dart',
      novelFileType: NovelFileType.TXT,
    );
    final result = await TxtConverter().convert(novel);
    expect(result.length, 1);
  });

  test('测试txt分章节', () async {
    final novel = Novel(
      novelId: '1',
      novelName: 'test',
      length: Int64(1),
      filePath: 'test/resouces/测试小说.txt',
      novelFileType: NovelFileType.TXT,
    );

    final result = await TxtConverter().convert(novel);
    expect(result.length, 7);
    final reader = IOReader(novel);
    for (var i = 0; i < result.length; i++) {
      reader
          .read(start: result[i].startCharIndex, end: result[i].endCharIndex)
          .forEach((element) {
        print(element);
      });
    }
    await Future.delayed(const Duration(seconds: 2));
  });
}
