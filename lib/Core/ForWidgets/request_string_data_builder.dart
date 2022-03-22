import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tesseract/Core/ForWidgets/recognized_word_data.dart';

class RequestStringDataBuilder{

  final TextEditingController textEditingController;
  String get queryString { return textEditingController.value.text;}
  List<RequestWordData> _selectedWords = [];
  //List<RecognizedWordData> _selectedRecognizedWords = [];

  RequestStringDataBuilder({required this.textEditingController}){
    textEditingController.addListener(_onTextFieldChangedListener);
  }

  void addSelectedWord(RecognizedWordData recWordData){
    /*if(!_selectedRecognizedWords.contains(recWordData)){
      _selectedRecognizedWords.add(recWordData);
    }
    _updateQuery();

     */
    //получаем слово запроса по распознанному, если такового нет, то создаём
    var newRequestWord = _selectedWords.firstWhere((element) => (element.connectedRecWord == recWordData),
      orElse: () => RequestWordData(recWordData, indexInRequestStringDataBuilder: _selectedWords.length)
      );

    print("added ${recWordData.value}");

    //если слова запроса ранее не было, то добавляем его. Пока сделал так, что бы
    //не обрабатывать не нужный трай-кэтч и из-за отсутствия(либо незнания на
    // данный момент реализации) в дарте возможности нахождения элемента в
    // списке по условию.

    if(!_selectedWords.contains(newRequestWord)){
      _selectedWords.add(newRequestWord);
    }
    _updateQuery();
  }

  void removeSelectedWord(RecognizedWordData recWordData) {
    /*
    if(_selectedRecognizedWords.contains(recWordData)){
      _selectedRecognizedWords.remove(recWordData);
    }
    _updateQuery();
     */

    //аналогично [addSelectedWord], только убираем найденное слоово из списка
    var newRequestWord = _selectedWords.firstWhere((element) =>
    (element.connectedRecWord == recWordData),
        orElse: () => RequestWordData(recWordData)
    );

    if (_selectedWords.contains(newRequestWord)) {
      _selectedWords.remove(newRequestWord);
      print("removed ${recWordData.value}");
    }


    _updateIndexes();
    _updateQuery();
  }

  bool isSelected(RecognizedWordData recWordData)
  {
    var reqWord = _selectedWords.firstWhere((element) => (element.connectedRecWord == recWordData),
        orElse: () => RequestWordData(recWordData, indexInRequestStringDataBuilder: _selectedWords.length)
    );
    return _selectedWords.contains(reqWord);
    //return _selectedRecognizedWords.contains(recWordData);
  }
  
  
  void _updateQuery(){
    var query = "";

    /*
    for(var word in _selectedRecognizedWords){
      query += word.value + " ";
    }
     */

    for(var word in _selectedWords){
      query+=word.queryValue + " ";
      query += " ";
    }

    textEditingController.value = textEditingController.value.copyWith(
      text: query,
    );
  }

  ///обновляем реальные индексы слов
  void _updateIndexes() {
    for(var word in _selectedWords) {
      word.updateRealIndex(_selectedWords.indexOf(word));
    }
  }


  _onTextFieldChangedListener() {
    var wordsInField = textEditingController.text.split(" ");
    List<RequestWordData> newWords = []; //новые слова(или изменённые) в поисковой строке

    List<RequestWordData> cloneOfSelectedWords = [];
    cloneOfSelectedWords.addAll(_selectedWords);

    List<RequestWordData> actualWords = [];

    //далее ищем эти новые слова и определяем старые, неизменённые
    for(var printedWord in wordsInField) {
      var containedWord = cloneOfSelectedWords.firstWhere((element) =>
      (element.queryValue == printedWord),
          orElse: () =>
              RequestWordData(RecognizedWordData(value: printedWord))
      );
      if(containedWord.queryValue.isNotEmpty) {
        actualWords.add(containedWord);
      }
      if(containedWord.queryValue.isNotEmpty && !cloneOfSelectedWords.contains(containedWord)){
        //если слово не пустое и не найдено в ранее добаввленных словах,
        //то это слово считается новым
        newWords.add(containedWord);
      }

      if(cloneOfSelectedWords.contains(containedWord)){
        cloneOfSelectedWords.remove(containedWord);
      }

    }
    //в результате цикла появляются:
    // все слова, разделённые пробелами(пустые тоже),
    // если значение слова совпадает с реальным значением слова из списка _selectedWords,
    // то этот обёект из списка записывается дублируется в список actualWords.
    // Но так же могут появится новые слова, которых не было добавленно,
    // и как новые объекты записываются слова, которые были выделены, но изменены
    // пользователем из строки редактирования запроса.
    // соответственно эти изменённые слова и определяются далее.

    List<RequestWordData> notFoundWords = [];

    for(var lastWord in _selectedWords){
      if(!actualWords.contains(lastWord)){
        //если старые слова в списке отображаемых не находятся, то
        //добавляем в список ненайденых слов.
        notFoundWords.add(lastWord);
        continue;
      }
    }

    //теперь у нас есть два списка: новых и ненайденных старых слов:

    //ненайденных старых слов может не оказаться, это означает, что
    //пользователь добавил своё новое. тут всё ок
    //в противном случае идём с эти разбираться.
    if(notFoundWords.isNotEmpty){
      //новых слов может не оказаться, значит пользователь стёр из строки слово,
      if(actualWords.isEmpty){
        for(var deletedWord in notFoundWords){
          deletedWord.markAsDeleted();
        }
      }else{
        //теперь надо определить, что же произошло?:
        //1)старое слово отредачил пользователь (тогда часть слова должна была сохраниться в новом)
        //2)старое слово было разбито пользователем (тогда новые слова есть начало/конец старого)
        //3)пользователь заменил старое слово на новое/новые (тогда новое слово(слова) не похожи на старые)
        for(var oldWord in notFoundWords){
          var newRedactedWord = _wordWasRedacted(oldWord, newWords);
          //1 случай
          if(newRedactedWord != null){
            //заменяем в actualWords это новое слово на данные старого
            oldWord.setRealQueryValue(newRedactedWord.queryValue);
            var indexOfNewWord = actualWords.indexOf(newRedactedWord);
            actualWords.replaceRange(indexOfNewWord, indexOfNewWord, [oldWord]);
            newWords.remove(newRedactedWord);
          }
          //2ой случай можно свести к первому, забив на второе получившееся слово
          // и принять его, как абсолютно новое
          //3тий случай выдаёт null в newRedactedWord, соответственно старое слово
          //считается удалённым
          else{
            oldWord.markAsDeleted();
          }
        }
      }

    }
    //обновляем _selectedWords
    _selectedWords = actualWords;
    _updateIndexes();
  }


  //есть таск на будущее(улучшить алгоритм)
  RequestWordData? _wordWasRedacted(RequestWordData oldWord, List<RequestWordData> newWords){

    RequestWordData? foundWord;

    //ввожу аксиому: Отредаченным считается то слово, в котором есть подстрока
    //из оригинального слова, длина которой не меньше длины половины оригинального слова
    //такой запрос должен закрыть большинства кейсов редактирования

    var maxLen = -1;
    for(var newWord in newWords){
      var maxPossibleLen = max(newWord.queryValue.length, oldWord.queryValue.length);
      var maxLocalLen = 0;
      //такая подстрока вообще может существовать
      if( maxPossibleLen >= oldWord.queryValue.length/2){
        for(int j = maxPossibleLen; j >= max(oldWord.queryValue.length/2, 1); j--) {
          bool wasFoundForthisNewWord = false;
          for (int i = 0; i <= oldWord.queryValue.length - j; i++) {
            var searchingSubString = oldWord.queryValue.substring(i, i+j-1);
            if(newWord.queryValue.contains(searchingSubString)){
              wasFoundForthisNewWord = true;
              break;
            }
          }

          if(wasFoundForthisNewWord){
            maxLocalLen = j;
            break;
          }
        }
      }

      if(maxLocalLen > maxLen){
        maxLen = maxLocalLen;
        foundWord = newWord;
      }

    }
    return foundWord;


    /* ТАСК на будущее (надо реплейснуть на это)
      //ввожу аксиму: слово считается отредактированным, если содержит в себе
      //не меньше половины букв из старого в том же относительном порядке
      //относительный порядок - порядок, в котором буквы расположены друг за другом,
      //игнорируя буквы между ними,
      //пример: изначальное слово: абв, новое слово 1) аобгв, 2)орбева 3) борагв
      //1) относительный порядок букв а,б,в соблюдён (его длина 3)
      //2) относительный порядок соблюдён только для б,в (его длина 2)
      //3) относительный порядок соблюдён для: а,в / б,в (его макс длина 2)
      var maxOrderLength = 0;
      RequestWordData maxOrderedNewWord;
      for(var newWord in newWords)
      {
        var maxLocalOrderLen = 0;
        var usingChars = newWord.queryValue.characters.toLowerCase();
        for (var letter in oldWord.queryValue.characters.toLowerCase()) {
          if(usingChars.contains(letter)){

          }
        }
      }
    */
  }

}

class RequestWordData {
  
  String get queryValue {
    return _currentQueryValue;
  }
  RecognizedWordData get connectedRecWord{
    return _connectedRecognizedWord;
  }

  String _currentQueryValue = "";
  bool _wasChangedByTextField = false;
  final RecognizedWordData _connectedRecognizedWord;
  late int indexInRequestStringDataBuilder;

  iTurnable? turnable;

  RequestWordData(this._connectedRecognizedWord, {this.indexInRequestStringDataBuilder = -1, this.turnable}) {
    _connectedRecognizedWord.addOnValueChangedCallback(_onRecognizedWordValueChanged);
    _updateQueryValue(_connectedRecognizedWord.value);
  }

  void markAsDeleted(){
    if(turnable != null) {
      turnable!.turn(false);
    }
  }

  void setRealQueryValue(String realQueryValue){
    _updateQueryValue(realQueryValue, fromRequestStringDataBuilder: true);
  }

  void updateRealIndex(int newIndex){
    if(newIndex >= 0){
      indexInRequestStringDataBuilder = newIndex;
    }else{
      return;
    }
  }

  void _updateQueryValue(String newQueryValue,
      {bool fromRequestStringDataBuilder = false}) {
    _currentQueryValue = newQueryValue;
    if (fromRequestStringDataBuilder) {
      _wasChangedByTextField = true;
    }
  }

  void _onRecognizedWordValueChanged(String newValue) {
    if (_wasChangedByTextField) {
      return;
    } else {

    }
  }

}

abstract class iTurnable{
  ///true - turn on, false - turn off
  void turn(bool on);
}
