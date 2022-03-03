import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/Failures/failure.dart';

class FailurePage extends StatelessWidget{

  final Failure failure;

  FailurePage(this.failure);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ПРОИЗОШЛА ОШИБКА'),
      ),
      body: Center(child: Text(failure.message)),
      floatingActionButton: SizedBox(
        width: 70,
          height: 70,
        child: FloatingActionButton(
          onPressed: () {
            failure.exit(context);
          },
          child: const Icon(
              Icons.arrow_back_outlined,
              size: 70,
              color: AppInDevStyle.widgetIconColorWhite,
          ),
          backgroundColor: Colors.redAccent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }


}