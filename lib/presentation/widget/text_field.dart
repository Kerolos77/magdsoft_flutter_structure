import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/font_styles.dart';

Widget textField({
  required BuildContext context,
required TextEditingController control,
  required TextInputType keyboardType,
  required String hint,
  IconData icon = Icons.abc,
  bool isPassword = false,
  bool obscure = false,
  bool isArabic = true,
  ValueChanged? onSubmit,
  ValueChanged? onchange,
  VoidCallback? onPressPrefixIcon,
  FormFieldValidator? validate,
}){
  return Container(
    width: MediaQuery.of(context).size.width*0.8,
    child: TextFormField(

      controller: control,
      keyboardType: keyboardType,
      onChanged: onchange,
      validator: validate,
      onFieldSubmitted: onSubmit,
      obscureText: obscure,
      cursorColor: AppColor.darkGray,

      textDirection: isArabic? TextDirection.rtl : TextDirection.ltr,
      decoration: InputDecoration(

        hintText: hint,
        hintStyle: FontStyles.textFieldFont,
        hintTextDirection:isArabic? TextDirection.rtl : TextDirection.ltr,
        filled: true,
        fillColor: AppColor.lightGray,
        suffixIcon: isPassword  ?IconButton(onPressed: onPressPrefixIcon, icon: Icon(icon,color: AppColor.gray,)):null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppColor.darkGray,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppColor.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: AppColor.red,
      ),
    ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: AppColor.darkGray,
          ),
        ),

      ),
    ),
  );
}