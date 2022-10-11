import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/imdb%20downloader/controller/IMDB_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await IMDBDownlodController()
                    .saveAndDownloadFile(
                        // video/vi1471530265==  seprate VideoID video from URL
                        // "https://www.imdb.com/{videoID}/%3Fref_%3Dext_shr_ln?ref_=ext_shr_lnk",
                        url:
                            "https://www.imdb.com/video/vi1471530265/%3Fref_%3Dext_shr_ln?ref_=ext_shr_lnk",
                        extenstion: ".mp3")
                    .whenComplete(() => null);
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                Get.find<Screencontroller>().updateDownloadProgress(0);
                await IMDBDownlodController().saveAndDownloadFile(
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
