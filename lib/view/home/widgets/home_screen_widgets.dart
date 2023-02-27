import 'package:downloader/constant/app_theme.dart';
import 'package:downloader/custom%20app%20widgets/text_widget.dart';
import 'package:downloader/features/facebook%20downloader/view/facebook_downloader.dart';
import 'package:downloader/features/imdb%20downloader/view/imdb_downloader_screen.dart';
import 'package:downloader/features/instadownloader/view/insta_downloader_screen.dart';
import 'package:downloader/features/vimeo/view/vimeo_downloader_screen.dart';
import 'package:downloader/features/youtube%20downloader/view/youtube_downloader_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      margin: EdgeInsets.only(top: Get.height * 0.07),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.15),
              spreadRadius: 7)
        ],
      ),
      child: Column(
        children: [
          CustomText(
            padding:
                EdgeInsets.only(top: Get.height * 0.03, left: Get.width * 0.04),
            text: "Pick a Platform",
            fontColor: AppTheme.appTextColor,
            fontSize: 0.025,
            fontWeight: FontWeight.w600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlatFormButton(
                asset: "assets/youtube.zip",
                onTap: () {
                  Get.to(() => const YoutubeDownloadeScreen());
                },
                title: "Youtube",
              ),
              PlatFormButton(
                asset: "assets/vimeo.zip",
                onTap: () {
                  Get.to(() => const VimeoDownloaderScreen());
                },
                size: 0.2,
                isRepeat: false,
                title: "Vimeo",
              ),
              PlatFormButton(
                asset: "assets/imdb.png",
                onTap: () {
                  Get.to(() => const IMDBDownloaderScreen());
                },
                size: 0.1,
                title: "IMDb",
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlatFormButton(
                  asset: "assets/instagram.zip",
                  onTap: () {
                    Get.to(() => const InstaDownloaderScreen());
                  },
                  title: "Instagram",
                ),
                PlatFormButton(
                  asset: "assets/facebook.zip",
                  onTap: () {
                    Get.to(() => const FacebookDownloaderScreen());
                  },
                  title: "facebook",
                ),
              ],
            ),
          ),
          CustomText(
            padding:
                EdgeInsets.only(top: Get.height * 0.08, left: Get.width * 0.05),
            text: "Version 1.0.1",
            fontColor: AppTheme.appTextColor,
            fontSize: 0.025,
            alignment: Alignment.center,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

class PlatFormButton extends StatelessWidget {
  const PlatFormButton(
      {super.key,
      required this.asset,
      this.isRepeat = false,
      this.size = 0.1,
      required this.title,
      required this.onTap});
  final String asset;
  final String title;
  final double size;
  final bool isRepeat;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: Get.height * 0.05),
        width: Get.width * 0.29,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.7,
                color: AppTheme.appTextColor.withOpacity(0.15),
                spreadRadius: 2)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
              child: title == "IMDb"
                  ? Image(
                      image: AssetImage(asset),
                      height: Get.height * 0.1,
                    )
                  : Lottie.asset(
                      asset,
                      repeat: isRepeat,
                      height: Get.height * size,
                    ),
            ),
            CustomText(
              padding: EdgeInsets.only(bottom: Get.height * 0.025),
              alignment: Alignment.center,
              textAlign: TextAlign.center,
              text: title,
            ),
          ],
        ),
      ),
    );
  }
}
