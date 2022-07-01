
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/font_styles.dart';

import '../styles/colors.dart';

Widget materialButton({required String text, VoidCallback? onPress, Color color =AppColor.blue}) =>
Container(
child: MaterialButton(
onPressed: onPress,
child: Padding(
  padding: EdgeInsets.all(16),
  child:   Text(text, style: FontStyles.buttonFont),
),),
decoration: BoxDecoration(
color: color,
borderRadius: BorderRadius.circular(15),
),
);