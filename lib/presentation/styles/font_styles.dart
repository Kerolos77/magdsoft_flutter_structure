
import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class FontStyles{

  // localization font style
  static const TextStyle? localizationFont =  TextStyle(
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColor.blue,
    letterSpacing: 0,
    height: 1.18,
  );

  // textField font style
  static const TextStyle? textFieldFont = TextStyle(
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: AppColor.gray,
    letterSpacing: 0,
    height: 1.15,
  );

  // button font style
  static const TextStyle? buttonFont = TextStyle(
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColor.white,
    letterSpacing: 0,
    height: 1.18,

  );

  // title of user data font style
  static const TextStyle? titleUserDataFont = TextStyle(
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w400,
    fontSize: 30,
    color: AppColor.white,
    letterSpacing: 0,
    height: 1,
  );

  // user data font style
  static const TextStyle? userDataFont = TextStyle(
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: AppColor.blue,
    letterSpacing: 0,
    height: 1,
  );

}