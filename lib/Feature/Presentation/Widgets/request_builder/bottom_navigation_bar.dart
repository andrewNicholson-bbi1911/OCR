import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';

class RequestBuilderBottomNavigationBar extends StatelessWidget{

  const RequestBuilderBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
        child: Container(
          padding: const EdgeInsets.only(top: 7, bottom: 7, left:25, right:25),
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppInDevStyle.botNavBarColorGray,
            ),
            child: Row(
              children: [
                RequestBuilderBottomNavBarButton(
                  icon: Icons.document_scanner_outlined,
                  text: "сканировать текст",
                ),
                RequestBuilderBottomNavBarButton(
                  icon: Icons.document_scanner_outlined,
                  text: "выделить всё",
                ),
                RequestBuilderBottomNavBarButton(
                  icon: Icons.document_scanner_outlined,
                  text: "отменить выделение",
                ),
              ],
            )
        )
      );
  }
}

class RequestBuilderBottomNavBarButton extends StatelessWidget{

  final IconData icon;
  final String text;

  RequestBuilderBottomNavBarButton({
    required this.icon,
    required this.text,
    Key? key})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GestureDetector(
            onTap: _emptyVoid,
            child: Column(
              children: [
                Icon(
                  icon,
                  color: AppInDevStyle.bottomNavBarIconData.color,
                  size: AppInDevStyle.bottomNavBarIconData.size,
                ),
                SizedBox(
                  width: 75,
                  child: Text(
                    text,
                    style: AppInDevStyle.bottomNavBarIconTextStyle,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  )
                )
              ],
            )
        )
    );
  }

  void _emptyVoid(){

  }
}