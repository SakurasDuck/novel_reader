import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/novel.dart';
import '../services/file/file_picker_utils.dart';

part 'picker_file.g.dart';

@riverpod
Future<Novel?> pickNovelFile(
  PickNovelFileRef ref,
) async {
  return FilePickerUitls.pick(allowedExtensions: ['txt', 'chm']);
}
