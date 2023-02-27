import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/custom%20app%20widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Screencontroller>(
        init: Screencontroller(),
        builder: (controller) {
          return Visibility(
            visible: Get.find<Screencontroller>().DownloadProgress != 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
              child: Column(
                children: [
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(50),
                    width: Get.width * 0.9,
                    alignment: MainAxisAlignment.center, lineHeight: 20.0,

                    percent:
                        Get.find<Screencontroller>().DownloadProgress / 100,

                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                  ),
                  CustomText(
                      alignment: Alignment.center,
                      text:
                          "Progresss ${Get.find<Screencontroller>().DownloadProgress}%"),
                ],
              ),
            ),
          );
        });
  }
}
