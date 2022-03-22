import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Feature/Presentation/Pages/datatron_request_builder_page.dart';
import 'package:tesseract/Feature/Presentation/Widgets/request_builder/recognition_words_list.dart';

import 'bottom_action_button.dart';

class RequestBuilderBottomNavigationBar extends StatelessWidget{

  final VoidCallback selectAllCallback;
  final VoidCallback deselectAllCallback;
  final VoidCallback backToScanningCallback;


  const RequestBuilderBottomNavigationBar({
    required this.backToScanningCallback,
    required this.selectAllCallback,
    required this.deselectAllCallback,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
        child: Container(
          padding: const EdgeInsets.only(top: 7, left: 25, right: 25),
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppInDevStyle.widgetBGGrayColor,
            ),
            child: Row(
              children: [
                RequestBuilderBottomActionButton(
                  iconName: 'back_scan_icon',
                  text: "Сканировать текст",
                  onTapAction: backToScanningCallback,
                ),
                RequestBuilderBottomActionButton(
                  iconName: 'select_all_icon',
                  text: "Выделить всё",
                  onTapAction: selectAllCallback,
                ),
                RequestBuilderBottomActionButton(
                  iconName: 'deselect_all_icon',
                  text: "Отменить выделение",
                  onTapAction: deselectAllCallback,
                ),
              ],
            )
        )
      );
  }
}


/*
class RequestBuilderBottomActionBarButton extends StatelessWidget{

  //final IconData icon;
  final String iconName;
  final String text;
  final void Function() onTapAction;

  RequestBuilderBottomActionBarButton({
    required this.iconName,
    required this.text,
    required this.onTapAction,
    Key? key})
      :super(key: key);

  //@override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GestureDetector(
            onTap: onTapAction,
            child: Column(
              children: [
                Image.asset('assets/images/icons/$iconName.png',
                color: AppInDevStyle.bottomNavBarIconData.color,
                  height: AppInDevStyle.bottomNavBarIconData.size,
                ),
                /*
                Icon(
                  icon,
                  color: AppInDevStyle.bottomNavBarIconData.color,
                  size: AppInDevStyle.bottomNavBarIconData.size,
                ),*/
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
}
*/