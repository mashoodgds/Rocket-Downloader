import 'dart:developer';

import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/imdb%20downloader/controller/IMDB_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
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
          LinkFeild(
            linkController: _linkController,
          ),
          ElevatedButton(
              onPressed: () async {
                await IMDBDownlodController()
                    .saveAndDownloadFile(
                        url: _linkController.text, extenstion: ".mp3")
                    .whenComplete(() =>
                        Get.find<Screencontroller>().updateDownloadProgress(0));
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                await IMDBDownlodController()
                    .saveAndDownloadFile(
                        url: _linkController.text, extenstion: ".mp4")
                    .whenComplete(() =>
                        Get.find<Screencontroller>().updateDownloadProgress(0));
              },
              child: const Text("Download Video")),
          GetBuilder<Screencontroller>(
              init: Screencontroller(),
              builder: (controller) {
                return Text(
                    "Progresss ${Get.find<Screencontroller>().DownloadProgress}");
              })
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
