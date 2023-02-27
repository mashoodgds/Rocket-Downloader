import 'package:downloader/constant/app_theme.dart';
import 'package:downloader/custom%20app%20widgets/buttons/custom_button.dart';
import 'package:downloader/custom%20app%20widgets/textfeilds.dart';
import 'package:downloader/features/youtube%20downloader/controller/yt_download_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class YoutubeDownloadeScreen extends StatefulWidget {
  const YoutubeDownloadeScreen({super.key});

  @override
  State<YoutubeDownloadeScreen> createState() => _YoutubeDownloadeScreenState();
}

class _YoutubeDownloadeScreenState extends State<YoutubeDownloadeScreen> {
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appPrimaryColor,
      ),
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
              await YTDownloadController()
                  .saveAudioFromYT(_linkController.text.trim())
                  .whenComplete(() {
                Fluttertoast.showToast(msg: "Completed");
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(msg: "$error");
              });
            },
          ),
          //Videp
          CustomButton(
            title: "Download Video",
            onClick: () async {
              await YTDownloadController()
                  .saveVideoFromYT(_linkController.text.trim())
                  .whenComplete(() {
                Fluttertoast.showToast(msg: "Completed");
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(msg: "$error");
              });
            },
          )
        ],
      ),
    );
  }
}
