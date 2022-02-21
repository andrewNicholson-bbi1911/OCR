class ImageRecognitionResultEntity{

  final String rawResaultString;
  final String recImagePath;
  late List<String> rawWords;
  late List<String> lines;
  ImageRecognitionResultEntity(this.recImagePath ,this.rawResaultString)
  {
    rawWords = rawResaultString.split(" ");
    lines = rawResaultString.split("\n");
  }
}