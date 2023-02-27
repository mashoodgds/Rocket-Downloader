import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Social_login Button
class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.title,
    this.color = AppTheme.primaryColor,
    required this.iconAssetPath,
    required this.onClick,
    this.alignment,
    this.padding,
    this.width = 0.55,
    this.heigth = 0.055,
    this.textSize = 0.034,
    this.textColor,
    this.fontWeight = FontWeight.w400,
    this.boarderRadius = 10,
  }) : super(key: key);
  final String title;
  final String iconAssetPath;
  final Color color;
  final Color? textColor;
  final void Function()? onClick;
  final double width;
  final FontWeight fontWeight;
  final double heigth;
  final double textSize;
  final double boarderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Container(
            width: Get.width * width,
            height: Get.height * heigth,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1.7,
                    color: AppTheme.appTextColor.withOpacity(0.12),
                    spreadRadius: 2)
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.03, right: Get.width * 0.03),
                  child: Image.asset(
                    iconAssetPath,
                    height: Get.height * 0.025,
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontWeight: fontWeight,
                      fontSize: Get.width * textSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
