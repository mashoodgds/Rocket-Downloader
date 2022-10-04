import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/instadownloader/controller/instadownloader_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
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
      body: Column(
        children: [
          LinkFeild(
            linkController: _linkController,
          ),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await InstaDownloaderController().downloadFromLink(
                    url: _linkController.text.trim(), extenstion: ".mp3");
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await InstaDownloaderController().downloadFromLink(
                    url: _linkController.text.trim(), extenstion: ".mp4");
              },
              child: const Text("Download Video")),
          GetBuilder<Screencontroller>(
              init: Screencontroller(),
              builder: (_controller) {
                return Text("Progresss ${_controller.DownloadProgress}");
              })
        ],
      ),
    );
  }
}
