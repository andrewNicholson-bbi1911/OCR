import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as imglib;

/// returns local document path of app
Future<String> get _localTempPath async {
  //final directory = await getApplicationDocumentsDirectory();
  final dir = await getTemporaryDirectory(); //всё таки пусть возвращает временную директорию
  return dir.path;
}

String makeUniqueName(String baseName){
  return '${baseName}_${DateTime.now().toIso8601String().replaceAll(".", "_")}';
}

Future<File> _getLocalTempFile(String fileName, String fileExtension, {String fileExtraDir = ""}) async {
  final path = await _localTempPath;
  final fullPath = '$path/${fileExtraDir == "" ? "": "$fileExtraDir/"}$fileName.$fileExtension';
  return File(fullPath);

}

Future<File> saveImage(String destFileName, imglib.Image image, {String destFileExtraDir = "", String imgExtension = "jpg", bool deleteOtherImages = true} ) async
{
  /*
  if(deleteOtherImages){
    deleteFilesInLocalDirectory(fileExtraDir: destFileExtraDir);
  }
  */
  destFileExtraDir = "";
  final file = await _getLocalTempFile(destFileName, imgExtension, fileExtraDir: destFileExtraDir);

  var resFile = file.writeAsBytes(imglib.encodeJpg(image));
  print("\n>> image was saved to: ${file.path}");
  return resFile;
}

Future<File> writeData(String destFileName, String destFileExtension, List<int> bytes, {String destFileExtraDir = ""}) async {
  final file = await _getLocalTempFile(destFileName, destFileExtension, fileExtraDir: destFileExtraDir);

  // Write the file
  return file.writeAsBytes(bytes);
}

Future<int> deleteFilesInLocalDirectory({String fileExtraDir = ""}) async{
  var localPath = await _localTempPath;
  var dir = Directory('$localPath/$fileExtraDir');
  print("\n>> deleting files in $dir");
  int deletedFiles = 0;
  var dirList = await dir.list(recursive: false).toList();
  for(var fileEntity in dirList){
    if((await _deleteFile(fileEntity)) == 0) {
      print("\n>> error, but was deleted $deletedFiles files in $dir");
      return 0;
    }
  }
  print("\n>> was deleted all $deletedFiles files in $dir");
  deletedFiles++;
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
  final file = await _getLocalTempFile(fileName, fileExtension, fileExtraDir: fileExtraDir);
  return _deleteFile(file);
}