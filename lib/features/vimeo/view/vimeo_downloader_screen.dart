import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/vimeo/controller/vimeo_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
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
          LinkFeild(
            linkController: _linkController,
          ),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await Get.find<VimeoDownlodController>().saveAndDownloadFile(
                    url: _linkController.text.trim(), extenstion: ".mp4");
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await Get.find<VimeoDownlodController>().saveAndDownloadFile(
                    url: _linkController.text.trim(), extenstion: ".mp4");
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
