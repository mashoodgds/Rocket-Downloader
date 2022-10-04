import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:direct_link/direct_link.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:random_string/random_string.dart';

class FacebookDownloaderController {
  Future<List<SiteModel>?>? getAvilableOption(String url) async {
    List<SiteModel>? check = await DirectLink.check(url);

    return check;
  }

  //add extenstion as .mp4 or .mp3 the file is without extenstion
  Future<File?> saveAndDownloadFile(
      {required String url, required String extenstion}) async {
    try {
      var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
      String name = "_facebook_video${randomAlpha(15)}$extenstion";
      final file = File("/${downloadsDirectoryPath!.path}/$name");

      final response =
          await Dio().get(url, onReceiveProgress: (received, total) {
        int percentage = ((received / total) * 100).floor();
        Get.find<Screencontroller>().updateDownloadProgress(percentage);
      },
              options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                receiveTimeout: 0,
              ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      inspect(e.toString());
      return null;
    }
  }
}
