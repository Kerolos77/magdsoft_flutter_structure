

import 'package:flutter/material.dart';

import '../../componants/applocal.dart';
import '../styles/font_styles.dart';

Widget userDataRow({
  required String title,
  required String value,
  required BuildContext context,
  bool isArabic = true,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('${getLang(context, title)}', textDirection: isArabic? TextDirection.rtl : TextDirection.ltr,style: FontStyles.userDataFont),
        Text(" : ", textDirection: isArabic?TextDirection.rtl : TextDirection.ltr,style: FontStyles.userDataFont),
        Text(value, textDirection: isArabic?TextDirection.rtl : TextDirection.ltr,style: FontStyles.userDataFont),


      ],
    );