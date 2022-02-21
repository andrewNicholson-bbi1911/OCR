import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:tesseract/Core/Tesseract/tesseract_recognition.dart' as TessCoreData;
import 'package:tesseract/Feature/Data/Models/recognition_result_model.dart';

abstract class LocalImageRecognizingSource {
  Future<ImageRecognitionResultModel> recognizeImage(String path, {RecognitionLanguage language = RecognitionLanguage.rus});
}

class TesseractLocalImageRecognizingSource extends LocalImageRecognizingSource{

  final Map<RecognitionLanguage, String> _langCodeMap = {
    RecognitionLanguage.rus: 'rus',
    RecognitionLanguage.eng: 'eng'
  };

  @override
  Future<ImageRecognitionResultModel> recognizeImage(String path, {RecognitionLanguage language = RecognitionLanguage.rus}) async{
    var langCode = _langCodeMap[language];
    langCode ??= TessCoreData.DEFAULT_LANG_CODE;


    var res = await TessCoreData.recognizeImageFromPath(path, langCode: langCode);

    print("SOURCE(TessLocRec)>>res of $path is:\n$res");

    var result = ImageRecognitionResultModel(path, res);

    return result;
  }

}

enum RecognitionLanguage{
  rus,
  eng
}