import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

final FToast fToast = FToast();
showToast(String? text,BuildContext context) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      //color: AppColors.lightGray,
    ),
    child: Text(text!),
  );
  fToast.context = context;
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 2),
  );
}

Future<bool?> toast({
  required String msg,
  Color backColor=AppColor.blue,
  Color textColor=AppColor.white,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backColor,
      textColor: textColor,
    );