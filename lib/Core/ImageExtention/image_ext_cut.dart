import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as imgLib;
import 'package:tesseract/Core/FileManagment/file_managment.dart';


///returns Image in JPG format
imgLib.Image imageFromSync(XFile file){
  var imFile = File(file.path);
  var rawDataBytes = imFile.readAsBytesSync();
  var img = imgLib.decodeJpg(rawDataBytes);
  if(img != null) {
    return img;
  }else{
    throw("Can not decode image from given XFile");
  }
}

Future<imgLib.Image> imageFrom(XFile file) async{

  var imfile = File(file.path);

  var rawDataBytes = await imfile.readAsBytes();
  var dataBytes = rawDataBytes.toList();
  print("==== source Xfile size is ${dataBytes.length}");

  imgLib.Image? resImg = imgLib.decodeImage(dataBytes);
  if(resImg != null){
    print("==== decodet image data size is ${resImg.data.length}");

    return resImg;
  }else{
    throw("Can not decode image from given XFile");
  }
}

imgLib.Image rotateAndCutImage(imgLib.Image srcImg, Offset leftTop, Offset rightBot){
  return cutImage(rotateImage(srcImg), leftTop, rightBot);
}

imgLib.Image rotateImage(imgLib.Image rotatingImg){
  return imgLib.copyRotate(rotatingImg, -90.0);
}

imgLib.Image cutImage(imgLib.Image croppingImg, Offset leftTop, Offset rightBot){

  int x = leftTop.dx.toInt();
  int y = leftTop.dy.toInt();
  Offset ratioVector = rightBot-leftTop;
  int w = ratioVector.dx.toInt();
  int h = ratioVector.dy.toInt();

  var result = imgLib.copyCrop( croppingImg, x, y, w, h);
  return result;
  /*
  var resFile = await saveImage('croppedImage_${DateTime.now().toIso8601String().replaceAll(".", "_")}', result, destFileExtraDir: )
  var bytes = result.getBytes().toList();
  var resultFile = await writeData('recognizingSegment_${DateTime.now().toIso8601String().replaceAll(".", "_")}', "jpg", bytes);

  print("FILE of size ${resultFile.statSync().size} saved to ${resultFile.path}");

  return resultFile;

   */
  /*
  //print("resoult resolution is ${result.width}x${result.height}");
  //var cuttenfile = XFile.fromData(result.getBytes());
  //print("saved file is size of ${await cuttenfile.length()}");

  await cuttenfile.saveTo(path+"recognizingImgPart_.jpg");
  print("saved file is actualy in ${cuttenfile.path}");

  //return cuttenfile;

   */
}
