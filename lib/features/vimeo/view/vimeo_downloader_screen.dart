import 'dart:developer';

import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/custom%20app%20widgets/buttons/custom_button.dart';
import 'package:downloader/custom%20app%20widgets/textfeilds.dart';
import 'package:downloader/features/vimeo/controller/vimeo_controller.dart';
import 'package:downloader/view/progress_indicaor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VimeoDownloaderScreen extends StatefulWidget {
  const VimeoDownloaderScreen({super.key});

  @override
  State<VimeoDownloaderScreen> createState() => _VimeoDownloaderScreenState();
}

class _VimeoDownloaderScreenState extends State<VimeoDownloaderScreen> {
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextFeild2(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.03),
            textEditingController: _linkController,
            title: 'Paste URl',
            isLeftEmpty: false,
          ),
          CustomButton(
            title: "Download Audio",
            onClick: () async {
              log("Taped");
              Get.find<Screencontroller>().updateDownloadProgress(0);
              await Get.find<VimeoDownlodController>().saveAndDownloadFile(
                  url: _linkController.text.trim(), extenstion: ".mp3");
              log("Complete");
            },
          ),
          CustomButton(
            title: "Download Video",
            onClick: () async {
              Get.find<Screencontroller>().updateDownloadProgress(0);
              await Get.find<VimeoDownlodController>().saveAndDownloadFile(
                  url: _linkController.text.trim(), extenstion: ".mp4");
            },
          ),
          const MyProgressIndicator()
        ],
      ),
    );
  }
}
