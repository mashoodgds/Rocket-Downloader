import 'package:downloader/features/instadownloader/view/insta_downloader_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreens extends StatelessWidget {
  const HomePageScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(const InstaDownloaderScreen());
            },
            child: SizedBox(
              width: Get.width * 0.1,
              height: Get.height * 0.1,
              child: const Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png")),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: Get.width * 0.1,
                color: const Color.fromARGB(255, 195, 194, 194),
                height: Get.height * 0.1,
                child: const Text("FaceBook")),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: const Color.fromARGB(255, 195, 194, 194),
                width: Get.width * 0.1,
                height: Get.height * 0.1,
                child: const Text("Vimeo")),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: const Color.fromARGB(255, 195, 194, 194),
                width: Get.width * 0.1,
                height: Get.height * 0.1,
                child: const Text("Youtube")),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: const Color.fromARGB(255, 195, 194, 194),
                width: Get.width * 0.1,
                height: Get.height * 0.1,
                child: const Text("IMDB")),
          ),
        ),
      ]),
    );
  }
}
