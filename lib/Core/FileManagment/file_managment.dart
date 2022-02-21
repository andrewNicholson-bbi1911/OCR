import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as imglib;

/// returns local document path of app
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

String makeUniqueName(String baseName){
  return '${baseName}_${DateTime.now().toIso8601String().replaceAll(".", "_")}';
}

Future<File> _getLocalFile(String fileName, String fileExtension, {String fileExtraDir = ""}) async {
  final path = await _localPath;
  final fullPath = '$path/$fileExtraDir$fileName.$fileExtension';
  return File(fullPath);
}

Future<File> saveImage(String destFileName, imglib.Image image, {String destFileExtraDir = "", String imgExtension = "jpg"} ) async
{
  final file = await _getLocalFile(destFileName, imgExtension, fileExtraDir: destFileExtraDir);

  return file.writeAsBytes(imglib.encodeJpg(image));
}

Future<File> writeData(String destFileName, String destFileExtension, List<int> bytes, {String destFileExtraDir = ""}) async {
  final file = await _getLocalFile(destFileName, destFileExtension, fileExtraDir: destFileExtraDir);

  // Write the file
  return file.writeAsBytes(bytes);
}

Future<int> deleteFilesInLocalDirectory({String fileExtraDir = ""}) async{
  var dir = Directory('$_localPath/$fileExtraDir');

  var dirList = await dir.list(recursive: false).toList();
  for(var fileEntity in dirList){
    if((await _deleteFile(fileEntity)) == 0) {
      return 0;
    }
  }
  return 1;
}
Future<int> deleteFile(String path){
  var file = File(path);
  return _deleteFile(file);
}

Future<int> _deleteFile(FileSystemEntity file) async{
  try{
    file.delete();
    return 1;
  }catch(e){
    return 0;
  }
}

Future<int> _deleteFileByName(String fileName, String fileExtension, {String fileExtraDir = ""}) async {
  final file = await _getLocalFile(fileName, fileExtension, fileExtraDir: fileExtraDir);
  return _deleteFile(file);
}