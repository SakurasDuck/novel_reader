import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/novel_file_type.dart';
import '../services/novel_directory_converter/converter_typed_interface.dart';
import '../services/novel_directory_converter/txt_converter.dart';

part 'novel_directory_converter.g.dart';

@riverpod
ConverterTyped getNovelDirectoryConverter(GetNovelDirectoryConverterRef ref,NovelFileType novelFileType) {
  switch (novelFileType) {
    case NovelFileType.TXT:
      return TxtConverter();
    default:
      throw UnimplementedError();
  }
}
