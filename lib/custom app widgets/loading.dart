import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Custom Loader
Widget loading({EdgeInsetsGeometry? padding}) {
  return Center(
    child: Padding(
      padding: padding ?? EdgeInsets.only(top: Get.height * 0.1),
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
        strokeWidth: 2,
      ),
    ),
  );
}
