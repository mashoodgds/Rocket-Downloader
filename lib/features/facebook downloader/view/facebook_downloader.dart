import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/facebook%20downloader/controller/facebok_downloader.dart';
import 'package:downloader/features/instadownloader/controller/instadownloader_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
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
          LinkFeild(
            linkController: _linkController,
          ),
          ElevatedButton(
              onPressed: () async {
                await Get.find<FacebookDownloaderController>()
                    .saveAndDownloadFile(
                        url: _linkController.text.trim(),
                        extenstion: ".mp3",
                        isHD: false);
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await Get.find<FacebookDownloaderController>()
                    .saveAndDownloadFile(
                        url: _linkController.text.trim(),
                        extenstion: ".mp4",
                        isHD: false);
              },
              child: const Text("Download Video in SD")),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await Get.find<FacebookDownloaderController>()
                    .saveAndDownloadFile(
                        url: _linkController.text.trim(),
                        extenstion: ".mp4",
                        isHD: true);
              },
              child: const Text("Download Video HD")),
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
