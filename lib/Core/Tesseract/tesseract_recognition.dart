import 'package:flutter_tesseract_ocr/android_ios.dart';

const String DEFAULT_LANG_CODE = 'rus';

Future<String> recognizeImageFromPath(String path, {String langCode = 'rus'}) {

  String resultText = "";

  if(langCode.isEmpty){
    langCode = DEFAULT_LANG_CODE;
  }

  print("start recognizing image located in ${path}...");
  var recognizedText = FlutterTesseractOcr.extractText(path, language: langCode,
      args: {
        "psm": "4",
        "preserve_interword_spaces": "1",
      }).
  then((res) => resultText = res);

  print("recognized text:\n$resultText");
  return recognizedText;
}