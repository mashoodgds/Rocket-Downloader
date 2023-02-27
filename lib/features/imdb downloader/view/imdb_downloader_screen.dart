import 'dart:developer';

import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/custom%20app%20widgets/buttons/custom_button.dart';
import 'package:downloader/custom%20app%20widgets/textfeilds.dart';
import 'package:downloader/features/imdb%20downloader/controller/IMDB_controller.dart';
import 'package:downloader/view/progress_indicaor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IMDBDownloaderScreen extends StatefulWidget {
  const IMDBDownloaderScreen({super.key});

  @override
  State<IMDBDownloaderScreen> createState() => _IMDBDownloaderScreenState();
}

class _IMDBDownloaderScreenState extends State<IMDBDownloaderScreen> {
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
              await IMDBDownlodController()
                  .saveAndDownloadFile(
                      url: _linkController.text, extenstion: ".mp3")
                  .whenComplete(() =>
                      Get.find<Screencontroller>().updateDownloadProgress(0));
            },
          ),
          CustomButton(
            title: "Download Video",
            onClick: () async {
              await IMDBDownlodController()
                  .saveAndDownloadFile(
                      url: _linkController.text, extenstion: ".mp4")
                  .whenComplete(() =>
                      Get.find<Screencontroller>().updateDownloadProgress(0));
            },
          ),
          const MyProgressIndicator()
        ],
      ),
    );
  }
}

String convertUrlToDownloadble(String url) {
  String downloadbleUrl = url;
  List<String> urlElements = url.split('/');

  for (int index = 0; index <= urlElements.length; index++) {
    if (urlElements[index] == "video") {
      String videoId = urlElements[index + 1];
      downloadbleUrl =
          "https://www.imdb.com/video/$videoId/%3Fref_%3Dext_shr_ln?ref_=ext_shr_lnk";
      break;
    }
  }
  inspect(downloadbleUrl);
  return downloadbleUrl;
}
