import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom Element Divider
class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.width = 1});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * width,
      height: Get.height * 0.0006,
      color: AppTheme.textfeildBoarder,
    );
  }
}
