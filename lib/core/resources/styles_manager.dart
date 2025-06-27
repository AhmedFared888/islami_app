import 'package:flutter/widgets.dart';
import 'package:islami/core/resources/font_manager.dart';

abstract class StylesManager {
  static TextStyle textStyle12(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s12,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle14(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s14,
      fontWeight: FontWeightManager.bold,
      color: color,
    );
  }

  static TextStyle textStyle17(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s17,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
  }

  static TextStyle textStyle20(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s20,
      fontWeight: FontWeightManager.bold,
      color: color,
    );
  }

  static TextStyle textStyle24(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s24,
      fontWeight: FontWeightManager.bold,
    );
  }

  static TextStyle textStyle36(Color color) {
    return TextStyle(
      fontSize: FontSizeManager.s36,
      fontWeight: FontWeightManager.regular,
      color: color,
    );
  }
}
