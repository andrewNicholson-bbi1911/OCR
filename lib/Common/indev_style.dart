import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInDevStyle{

  static const Color pageBGColorGray = Color(0xFFF1F1F0);

  static const String mainFontFamily = "PT_Sans";

  static const Color widgetBGGrayTransparentColor = Color(0x1F767680);
  static const Color widgetBGSandBlueColor = Color(0xFF2177B7);
  static const Color widgetBGColorWhite = Color(0xFFFEFEFE);
  static const Color widgetIconColorWhite = Color(0xFFFFFFFF);
  static const Color widgetBGGrayColor = Color(0xFF787878);
  static const Color widgetBGLightGrayColor = Color(0xFFEDEDED);


  static const Color fontColorSandBlue = Color(0xFF2177B7);
  static const Color fontColorLightGray = Color(0xFF5E5E5E);
  static const Color fontColorRespCountGray = Color(0xFF8F8F8F);
  static const Color fontColorGray = Color(0xFF5B5B5B);
  static const Color fontColorDarkGray = Color(0xFF333333);
  static const Color fontColorBlack = Color(0xFF000000);
  static const Color fontColorWhite = Color(0xFFFFFFFF);
  static const Color fontPageTitleColorGray = Color(0xFF5D5B59);

  static const Color loadingScreenBGColor = Color(0xFFF1F1F0);
  static const Color appBarBGColor = Color(0xFFFFFFFF);

  static const IconThemeData bottomNavBarIconData =
      IconThemeData(
        color: Colors.white,
        size: 30,
      );

  static const TextStyle requestLineTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontPageTitleColorGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );


  static const TextStyle bottomNavBarIconTextStyle =
      TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,

      );

  static const TextStyle appBarTitleTextStyle =
      TextStyle(
        fontSize: 18,
        color: fontPageTitleColorGray,
        fontWeight: FontWeight.w700,
        fontFamily: mainFontFamily,
      );

  static const TextStyle resultMetadataTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontColorLightGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );

  static const TextStyle resultMetadataQueryStringTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontColorDarkGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );


  static const TextStyle resultMetadataQueryTextStyle =
      TextStyle(
        fontSize: 18,
        color: fontColorSandBlue,
        fontWeight: FontWeight.w700,
        fontFamily: mainFontFamily,
      );

  static const TextStyle resultMetadataCountStringTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontColorGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );

  static const TextStyle resultMetadataCountTextStyle =
      TextStyle(
        fontSize: 18,
        color: fontColorGray,
        fontWeight: FontWeight.w700,
        fontFamily: mainFontFamily,
      );

  static const TextStyle datatronAnswerNameTextStyle =
      TextStyle(
        fontSize: 18,
        color: fontColorDarkGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );

  static const TextStyle datatronAnswerSourceTextStyle =
      TextStyle(
        fontSize: 18,
        color:  fontColorDarkGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );

  static const TextStyle datatronAnswerAccentInfoTextStyle =
      TextStyle(
        fontSize: 36,
        color: fontColorBlack,
        fontWeight: FontWeight.w700,
        fontFamily: mainFontFamily,
      );

  static const TextStyle datatronAnswerAccentInfoExtraTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontColorGray,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );

  static const TextStyle datatronAnswerGoToTextStyle =
      TextStyle(
        fontSize: 16,
        color: fontColorSandBlue,
        fontWeight: FontWeight.w400,
        fontFamily: mainFontFamily,
      );
}
