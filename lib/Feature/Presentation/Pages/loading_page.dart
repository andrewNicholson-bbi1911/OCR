import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tesseract/Common/indev_style.dart';

class LoadingPage extends StatelessWidget{

  final String loaderText;

  LoadingPage({this.loaderText = 'loading'}) : super();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /*
        appBar: AppBar(
          title: Text(loaderText),
          centerTitle: true,
        ),*/
        body: RiveAnimation.asset("assets/animations/loading/loading.riv"),
        backgroundColor: AppInDevStyle.loadingScreenBGColor,

      //colo
    );
  }

}


