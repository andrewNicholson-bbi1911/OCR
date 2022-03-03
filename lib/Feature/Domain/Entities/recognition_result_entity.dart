import 'dart:ui';

import 'package:tesseract/Core/ForWidgets/recognized_word_data.dart';

class ImageRecognitionResultEntity{

  final String rawResaultString;
  final String recImagePath;
  late List<String> rawWords;
  late List<String> lines;

  ImageRecognitionResultEntity(this.recImagePath ,this.rawResaultString)
  {
    rawResaultString.replaceAll("|", "").replaceAll("\\", "");
    rawWords = rawResaultString.split(" ");
    lines = rawResaultString.split("\n");
  }
}