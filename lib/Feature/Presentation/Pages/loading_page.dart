import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        body:Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(

            child: CircularProgressIndicator(),
          ),
        )
    );
  }

}


