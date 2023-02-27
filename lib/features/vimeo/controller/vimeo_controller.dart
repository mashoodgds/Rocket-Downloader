import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:direct_link/direct_link.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:random_string/random_string.dart';

class VimeoDownlodController extends GetxService {
  Future<File?> saveAndDownloadFile({
    required String url,
    required String extenstion,
  }) async {
    try {
      // get avilable option about video type
      String? link = await _getVideoLink(
        url: url,
      );
      if (link == null) return null;
      String fileName = "Vimeo_video${randomAlpha(15)}$extenstion";
      var downloadedFile = await _downloadedFile(url: link, filename: fileName);
      return downloadedFile;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      inspect(e.toString());
      return null;
    }
  }

  Future<String?> _getVideoLink({required String url}) async {
    List<SiteModel>? vimeoUrls = await DirectLink.check(url);
    if (vimeoUrls!.isNotEmpty) {
      return vimeoUrls[0].link;
    }
    log("Video URL Not Found");
    return null;
  }

  _downloadedFile({required String url, required String filename}) async {
    var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();

    final File file = File("/${downloadsDirectoryPath!.path}/$filename");

    final response = await Dio().get(url, onReceiveProgress: (received, total) {
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
  }
}
