import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesseract/Common/indev_style.dart';

class RequestBuilderBottomActionButton extends StatefulWidget{


  //final IconData icon;
  final String iconName;
  final String text;
  final void Function() onTapAction;

  RequestBuilderBottomActionButton({
    required this.iconName,
    required this.text,
    required this.onTapAction,
    Key? key})
      :super(key: key);



  @override
  State<RequestBuilderBottomActionButton> createState() => _RequestBuilderBottomActionButtonState();

}

class _RequestBuilderBottomActionButtonState extends State<RequestBuilderBottomActionButton>{

  static const double _maxScale = 1.1;
  static const double _minScale = 1.0;

  static const double _minOpacity = 0.8;
  static const double _maxOpacity = 1.0;

  static const int _oneChangePeriodMilliseconds = 100;

  double _scale = _minScale;
  double _opacity = _maxOpacity;
  bool _justPressed = false;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: AnimatedOpacity(

            duration: const Duration(milliseconds: _oneChangePeriodMilliseconds-1),
            opacity: _opacity,
            child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: _oneChangePeriodMilliseconds),
                //onEnd: _backScale,
                child: GestureDetector(
                    onPanDown: (_) => {_onPressed()}, //не совсем понял почему,
                    // но если не засунуть метод в скобки, то он не вызывается,
                    // наверно потому что onPanDown принимает только функции со
                    // спецефическими аргументами
                    onPanEnd: (_) => {_backScale()},
                    //onTap: _onPressed,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset('assets/images/icons/${widget.iconName}.png',
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
                                widget.text,
                                style: AppInDevStyle.bottomNavBarIconTextStyle,
                                softWrap: true,
                                textAlign: TextAlign.center,

                              )
                          )
                        ],
                      )
                    )
                )
            )
        )


    );
  }

  void _onPressed(){
    widget.onTapAction();
    _startAnimation();
  }

  void _startAnimation(){
    setState(() {
      _scale = _maxScale;
      _opacity = _minOpacity;
      _justPressed = true;
    });
  }

  void _backScale(){
    //if(_justPressed) {
      setState(() {
        _scale = _minScale;
        _opacity = _maxOpacity;
        _justPressed = false;
      });
    //}
  }
}