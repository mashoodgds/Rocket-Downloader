import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/custom%20app%20widgets/buttons/custom_button.dart';
import 'package:downloader/custom%20app%20widgets/textfeilds.dart';
import 'package:downloader/features/facebook%20downloader/controller/facebok_downloader.dart';
import 'package:downloader/view/progress_indicaor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FacebookDownloaderScreen extends StatefulWidget {
  const FacebookDownloaderScreen({super.key});

  @override
  State<FacebookDownloaderScreen> createState() =>
      _FacebookDownloaderScreenState();
}

class _FacebookDownloaderScreenState extends State<FacebookDownloaderScreen> {
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
              await Get.find<FacebookDownloaderController>()
                  .saveAndDownloadFile(
                      url: _linkController.text.trim(),
                      extenstion: ".mp3",
                      isHD: false);
            },
          ),
          CustomButton(
            title: "Download Video In SD",
            onClick: () async {
              Get.find<Screencontroller>().updateDownloadProgress(0);
              await Get.find<FacebookDownloaderController>()
                  .saveAndDownloadFile(
                      url: _linkController.text.trim(),
                      extenstion: ".mp4",
                      isHD: false);
            },
          ),
          CustomButton(
            title: "Download Video In HD",
            onClick: () async {
              Get.find<Screencontroller>().updateDownloadProgress(0);
              await Get.find<FacebookDownloaderController>()
                  .saveAndDownloadFile(
                      url: _linkController.text.trim(),
                      extenstion: ".mp4",
                      isHD: true);
            },
          ),
          const MyProgressIndicator()
        ],
      ),
    );
  }
}
