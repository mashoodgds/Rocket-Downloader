import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Custom Button Widget
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.color = const Color.fromARGB(255, 111, 1, 131),
    this.isDisable = false,
    required this.onClick,
    this.alignment,
    this.padding,
    this.boarderColor = AppTheme.appPrimaryColor,
    this.width = 0.55,
    this.heigth = 0.06,
    this.textSize = 0.039,
    this.textColor,
    this.fontWeight = FontWeight.w500,
    this.boarderRadius = 100,
  }) : super(key: key);
  final String title;
  final bool isDisable;
  final Color color;
  final Color? textColor;
  final Color boarderColor;
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
      onTap: isDisable ? null : onClick,
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: Get.height * 0.02),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Container(
            width: Get.width * width,
            height: Get.height * heigth,
            decoration: BoxDecoration(
                border: Border.all(
                    color: isDisable
                        ? boarderColor.withOpacity(0.0)
                        : boarderColor,
                    width: 1),
                borderRadius: BorderRadius.circular(boarderRadius),
                color: isDisable ? color.withOpacity(0.3) : color),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: fontWeight,
                    fontSize: Get.width * textSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
