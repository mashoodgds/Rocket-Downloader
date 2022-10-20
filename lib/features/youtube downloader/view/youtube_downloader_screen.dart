import 'package:downloader/features/youtube%20downloader/controller/yt_download_controller.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          LinkFeild(
            linkController: _linkController,
          ),
          ElevatedButton(
              onPressed: () async {
                await YTDownloadController()
                    .saveAudioFromYT(_linkController.text.trim())
                    .whenComplete(() {
                  Fluttertoast.showToast(msg: "Completed");
                }).onError((error, stackTrace) {
                  Fluttertoast.showToast(msg: "$error");
                });
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                await YTDownloadController()
                    .saveVideoFromYT(_linkController.text.trim())
                    .whenComplete(() {
                  Fluttertoast.showToast(msg: "Completed");
                }).onError((error, stackTrace) {
                  Fluttertoast.showToast(msg: "$error");
                });
              },
              child: const Text("Download Video")),
        ],
      ),
    );
  }
}
