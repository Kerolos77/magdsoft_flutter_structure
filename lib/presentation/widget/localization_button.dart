
import 'package:flutter/material.dart';

import '../../componants/applocal.dart';
import '../styles/colors.dart';
import '../styles/font_styles.dart';

Widget localizationButton(
    {required BuildContext context, VoidCallback? onPress}) =>
    Container(
      height: 40,
      child: MaterialButton(

        onPressed: onPress,
        child: Text(getLang(context, 'lang'), style: FontStyles.localizationFont),
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );