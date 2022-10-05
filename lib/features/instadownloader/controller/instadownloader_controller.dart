import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:random_string/random_string.dart';

class InstaDownloaderController extends GetxService {
  Future<File?> downloadFromLink(
      {required String url, required String extenstion}) async {
    try {
      FlutterInsta flutterInsta = FlutterInsta();
      String? downloadLink = await flutterInsta.downloadReels(url);

      if (downloadLink != null) {
        Directory? downloadsDirectoryPath =
            await DownloadsPath.downloadsDirectory();
        String fileName = "insta_video_${randomAlpha(15)}$extenstion";
        final file = File("/${downloadsDirectoryPath!.path}/$fileName");
        final response =
            await Dio().get(downloadLink, onReceiveProgress: (received, total) {
          int percentage = ((received / total) * 100).floor();
          Get.find<Screencontroller>().updateDownloadProgress(percentage);
        },
                options: Options(
                  maxRedirects: 10,
                  responseType: ResponseType.bytes,
                  followRedirects: false,
                  receiveTimeout: 0,
                ));

        final raf = file.openSync(mode: FileMode.write);

        raf.writeFromSync(response.data);
        await raf.close();

        return file;
      } else {
        return null;
      }
    } catch (e) {
      // change in production
      Fluttertoast.showToast(msg: "$e");
      return null;
    }
  }
}
