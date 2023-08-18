import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/services/file/temp_file_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helpers/lock.dart';
import '../../models/novel_file_type.dart';
import '../uuid.dart';

class FilePickerUitls {
  static Future<PlatformFile?> _pickFile(
      {FileType fileType = FileType.custom,
      List<String> allowedExtensions = const []}) async {
    final result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowedExtensions: allowedExtensions,
        allowMultiple: false);
    if (result != null) {
      return result.files.single;
    }
    return null;
  }

  static final Lock _lock = Lock();

  /// 获取权限
  static Future<bool> _getPermission() async {
    return await _lock.mutex(() async {
      final result = await Permission.storage.isGranted;
      if (result) {
        return true;
      }

      return await Permission.storage.request().isGranted;
    });
  }

  /// 选择文件(返回是app内部备份的文件路径)
  /// [fileType] 文件类型
  /// [allowedExtensions] 允许的后缀名
  static Future<Novel?> pick(
      {FileType fileType = FileType.custom,
      List<String> allowedExtensions = const []}) async {
    if (await _getPermission()) {
      final file = await _pickFile(
          fileType: fileType, allowedExtensions: allowedExtensions);
      if (file != null) {
        if (kIsWeb) {
          return Novel(
              novelId: UuidService.uuid,
              novelName: file.name,
              length: file.size,
              novelFileType: NovelFileTypeExt.fromString(file.extension ?? ''),
              bytes: file.bytes);
        } else {
          final tempFile = await TempFileUtil.generateRandomTempFile();
          await File(file.path!).copy(tempFile.path);
          return Novel(
              novelId: UuidService.uuid,
              novelName: file.name,
              filePath: file.path!,
              length: file.size,
              novelFileType: NovelFileTypeExt.fromString(file.extension ?? ''));
        }
      }
    } else {
      throw Exception('没有权限');
    }
    return null;
  }
}
