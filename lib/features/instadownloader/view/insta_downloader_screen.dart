import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/custom%20app%20widgets/buttons/custom_button.dart';
import 'package:downloader/custom%20app%20widgets/textfeilds.dart';
import 'package:downloader/features/instadownloader/controller/instadownloader_controller.dart';
import 'package:downloader/view/progress_indicaor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstaDownloaderScreen extends StatefulWidget {
  const InstaDownloaderScreen({super.key});
  @override
  State<InstaDownloaderScreen> createState() => _InstaDownloaderScreenState();
}

class _InstaDownloaderScreenState extends State<InstaDownloaderScreen> {
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
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
            Get.find<Screencontroller>().updateDownloadProgress(0);
            await Get.find<InstaDownloaderController>().downloadFromLink(
                url: _linkController.text.trim(), extenstion: ".mp3");
          },
        ),
        CustomButton(
          title: "Download Video",
          onClick: () async {
            Get.find<Screencontroller>().updateDownloadProgress(0);

            await Get.find<InstaDownloaderController>().downloadFromLink(
                url: _linkController.text.trim(), extenstion: ".mp4");
          },
        ),
        const MyProgressIndicator()
      ]),
    );
  }
}
