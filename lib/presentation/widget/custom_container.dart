
import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget customContainer({required Widget child,required BuildContext context}) {
  return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.7,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50))),
        child: child,

  );
}