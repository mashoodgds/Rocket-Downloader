import 'package:downloader/constant/app_theme.dart';
import 'package:downloader/custom%20app%20widgets/text_widget.dart';
import 'package:downloader/features/facebook%20downloader/view/facebook_downloader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'widgets/home_screen_widgets.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                color: AppTheme.appPrimaryColor,
                width: Get.width,
                height: Get.height * 1,
              ),
              Column(
                children: [
                  CustomText(
                    padding: EdgeInsets.only(
                        top: Get.height * 0.08, left: Get.width * 0.05),
                    text: "Rocket Downlaoder",
                    fontColor: Colors.white,
                    fontSize: 0.025,
                    fontWeight: FontWeight.w600,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.19),
                    padding: EdgeInsets.only(top: Get.height * 0.03),
                    child: Lottie.asset("assets/rocket_lottie.zip",
                        repeat: true, height: 250),
                  ),
                  const HomePageBody(),
                ],
              ),
            ],
          ),
        ));
  }
}
