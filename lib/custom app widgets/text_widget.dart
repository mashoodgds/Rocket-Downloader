import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom_Text for whole app
class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize = 0.015,
      this.padding,
      this.alignment,
      this.fontColor,
      this.fontWeight,
      this.isItalic = false,
      this.textAlign})
      : super(key: key);
  final String text;
  final double fontSize;
  final bool isItalic;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final AlignmentGeometry? alignment;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: Align(
        alignment: alignment ?? Alignment.topLeft,
        child: Text(text,
            textAlign: textAlign ?? TextAlign.start,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: fontColor ?? AppTheme.appTextColor,
              fontSize: Get.height * fontSize,
            ))),
      ),
    );
  }
}

////////////////////////////////////////////////////////