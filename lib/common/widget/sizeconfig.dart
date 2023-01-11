import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  //safe area
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  //padding
  static double? left;
  static double? right;
  static double? top;
  static double? bottom;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData?.size.width;
    _screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = _screenWidth! / 100;
    blockSizeVertical = _screenHeight! / 100;

    //safe area
    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (_screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (_screenHeight! - _safeAreaVertical!) / 100;

    //padding
    left = _mediaQueryData!.padding.left / 100;
    right = _mediaQueryData!.padding.right / 100;
    top = _mediaQueryData!.padding.top / 100;
    bottom = _mediaQueryData!.padding.bottom / 100;
  }
}