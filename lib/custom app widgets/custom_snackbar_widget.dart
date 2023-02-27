import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class MySnackbar extends StatelessWidget {
//   const MySnackbar({super.key, required this.msg});
//   final String msg;
//   @override
//   Widget build(BuildContext context) {
//     return showSnackbar(context, msg);
//   }
// }

//Custom SNACK_BAR to progress
showSnackbar(context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

customLoadingAlert(
    {context, String title = "Please Wait", required String subtitle}) {
  return Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: AppTheme.backgroundScreenColor,
      title: title,
      titleStyle: const TextStyle(
          color: AppTheme.appTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w300),
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircularProgressIndicator(
          color: Colors.green,
          strokeWidth: 2,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          subtitle,
          style: const TextStyle(color: AppTheme.hintTextColor),
        )
      ]));
}
