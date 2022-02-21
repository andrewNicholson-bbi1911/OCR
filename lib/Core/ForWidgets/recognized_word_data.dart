class RecognizedWordData{

  String value = "";

  RecognizedWordData({required this.value});

  ChangeValue(String newValue){
    //если пытаемся заменить на пустой текст, то не меняем
    if(newValue.replaceAll(" ", "") == "")
    {
      return;
    }
    value = newValue;
  }
}