import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';

import '../../helpers/lock.dart';

class TempFileUtil {
  static bool _init=false;

  static final Lock _lock = Lock();

  static Future<void> _doInit() async{
    if(_lock.isUsing()){
      await _lock.waitDone();
      return;
    }
    await _lock.mutex(()async{
       final Directory root = await getApplicationDocumentsDirectory();
    Directory.current=root;
    _init=true;
    });
  }

  /// 返回的是绝对路径
  /// 在临时目录下生成随机文件
  /// path 为额外路径
  /// 格式必需为 /pathA/pathB/
  /// 已斜杠开始,并且斜杠结尾
  static Future<File> generateRandomTempFile(
      {String path = '/', String? fileType}) async {
   final  String tempFilePath =
        await generateRandomTempFilePath(path: path, fileType: fileType);
    return File(tempFilePath).create(recursive: true);
  }

  /// 返回的是绝对路径
  ///  /cache/test/xxx.png  返回示例
  /// [fileType] 例子: m4a , aac , mp3
  static Future<String> generateRandomTempFilePath(
      {String path = '/', String? fileType}) async {
    assert(path.isNotEmpty);
    assert(path.startsWith('/'));
    assert(path.endsWith('/'));
    if(_init==false){
      await _doInit();
    }
   final  Directory tempDir = await getTemporaryDirectory();
    File file;
    for (;;) {
      if (fileType == null) {
        file =File('${tempDir.path}$path${Random().nextInt(4294967000)}');
      } else {
        file = File(
            '${tempDir.path}$path${Random().nextInt(4294967000)}.$fileType');
      }

      if (!file.existsSync()) {
        return file.path;
      }
    }
  }

  /// 在ios如果升级应用的会导致应用的沙盒路径会发生变化,因此要使用相对路径(重要)
  /// 在应用目录下生成随机文件,返回的文件时相对与getApplicationDocumentsDirectory()目录下的文件,调用[File.path]返回的是相对路径
  /// path 为额外路径
  /// 格式必需为 xxx/sss/(path为相对路径)
  /// 斜杠结尾
  /// [fileType] 例子: m4a , aac , mp3
  static Future<File> generateRandomAppRelativeFile(
      {String path = '', String? fileType}) async {
    final String tempAppFilePath =
        await generateRandomAppRelativeFilePath(path: path, fileType: fileType);
    return File(tempAppFilePath).create(recursive: true);
  }

  /// 在ios如果升级应用的会导致应用的沙盒路径会发生变化,因此要使用相对路径(重要)
  /// 返回的相对于getApplicationDocumentsDirectory()的路径
  /// cache/test/xxx.png  返回示例
  /// [fileType] 例子: m4a , aac , mp3
  static Future<String> generateRandomAppRelativeFilePath(
      {String path = '', String? fileType}) async {
    assert(!path.startsWith('/'));
    assert(path.endsWith('/'));
    if(_init==false){
      await _doInit();
    }
    File file;
    for (;;) {
      if (fileType == null) {
        file =
            File('$path${Random().nextInt(4294967000)}');
      } else {
        file = File(
            '$path${Random().nextInt(4294967000)}.$fileType');
      }
      if (!file.existsSync()) {
        return file.path;
      }
    }
  }
}
