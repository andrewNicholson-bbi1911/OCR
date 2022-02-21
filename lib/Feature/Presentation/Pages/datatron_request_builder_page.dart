import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Feature/Domain/Entities/recognition_result_entity.dart';
import 'package:tesseract/Feature/Presentation/Pages/datatron_response_stage_main.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/bottom_navigation_bar.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/recognition_words_list.dart';

class RequestBuilderPage extends StatelessWidget{

  final ImageRecognitionResultEntity _recResult;

  RequestBuilderPage(this._recResult) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("РЕЗУЛЬТАТЫ СКАНИРОВАНИЯ"),
        titleTextStyle: AppInDevStyle.appBarTitleTextStyle,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppInDevStyle.floatButtonBGSandBlueColor,
        ),
        backgroundColor: AppInDevStyle.appBarBGColor,
      ),
      extendBody: false,
      body: RecognitionWordsList(_recResult.lines),
      backgroundColor: AppInDevStyle.pageBGColorGray,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            _showResults(context, "Test Request ${DateTime.now().toIso8601String()}");
            },
          backgroundColor: AppInDevStyle.floatButtonBGSandBlueColor,
          child: const Icon(
            Icons.search,
            size: 35,
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const RequestBuilderBottomNavigationBar()
    );
  }

  void _showResults(BuildContext context, String requestQuery){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatatronResponseMain(requestQuery),
      ),
    );
  }

  Widget? _getNavBar(){
    return DotNavigationBar(
      currentIndex: 0,
      onTap: (index) => { print("tapped")},
      // dotIndicatorColor: Colors.black,
      items: [
        /// Home
        DotNavigationBarItem(
          icon: Icon(Icons.home),
          selectedColor: Colors.purple,
        ),

        /// Likes
        DotNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          selectedColor: Colors.pink,
        ),

        /// Search
        DotNavigationBarItem(
          icon: Icon(Icons.search),
          selectedColor: Colors.orange,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: Icon(Icons.person),
          selectedColor: Colors.teal,
        ),

      ],
    );
  }
}