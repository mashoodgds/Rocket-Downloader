import 'dart:developer';
import 'dart:html';
import 'package:direct_link/direct_link.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/features/facebook%20downloader/controller/facebok_downloader.dart';
import 'package:downloader/view/home%20page/widgets/link_feild_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
                FacebookDownloaderController().saveAndDownloadFile(
                    url: _linkController.text.trim(), extenstion: ".mp3");
              },
              child: const Text("Download Audio")),
          ElevatedButton(
              onPressed: () async {
                FacebookDownloaderController().saveAndDownloadFile(
                    url: _linkController.text.trim(), extenstion: ".mp3");
              },
              child: const Text("Download Video High quality")),
          ElevatedButton(
              onPressed: () async {
                FacebookDownloaderController().saveAndDownloadFile(
                    url: _linkController.text.trim(), extenstion: ".mp3");
              },
              child: const Text("Download Video High quality")),
          GetBuilder<Screencontroller>(
              init: Screencontroller(),
              builder: (_controller) {
                return Text(
                    "Progresss ${Get.find<Screencontroller>().DownloadProgress}");
              })
        ],
      ),
    );
  }
}

Future bottomSheet(context, url) {
  return Get.bottomSheet(
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.37,
      child: FutureBuilder(
          //     future: FacebookDownloader().getAvilableOption(url),
          builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data}");
        } else if (snapshot.hasError) {
          return const Warrning(
            msg: "We are unable to load info",
          );
        } else {
          return const Warrning(
            msg: "Please Wait",
          );
        }
      }),
    ),
    barrierColor: Colors.black.withOpacity(0.4),
    backgroundColor: const Color(0xff5B70AB).withOpacity(0.9),
    enableDrag: true,
    isDismissible: false,
  );
}

class Warrning extends StatelessWidget {
  const Warrning({Key? key, this.msg}) : super(key: key);
  final msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$msg",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ))),
    );
  }
}
