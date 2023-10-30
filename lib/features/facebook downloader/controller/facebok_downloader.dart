import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:direct_link/direct_link.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:random_string/random_string.dart';

class FacebookDownloaderController extends GetxService {
  //add extenstion as .mp4 or .mp3 the file is without extenstion
  Future<File?> saveAndDownloadFile(
      {required String url,
      required String extenstion,
      required bool isHD}) async {
    try {
      // get avilable option about video type
      String? link =
          await _getVideoHDLink(url: url, quality: isHD ? "hd" : "sd");
      if (link == null) return null;
      String fileName = "facebook_video${randomAlpha(15)}$extenstion";
      var downloadedFile = await _downloadedFile(url: link, filename: fileName);
      return downloadedFile;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      inspect(e.toString());
      return null;
    }
  }
  Future<File?> saveFileToGallary(
      {required String url,
      required String extenstion,
      required bool isHD}) async {
    try {
      // get avilable option about video type
      String? link =
          await _getVideoHDLink(url: url, quality: isHD ? "hd" : "sd");
      if (link == null) return null;
      String fileName = "facebook_video${randomAlpha(15)}$extenstion";
      var downloadedFile = await _downloadedFile(url: link, filename: fileName);
      return downloadedFile;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      inspect(e.toString());
      return null;
    }
  }

  Future<String?> _getVideoHDLink(
      {required String url, required String quality}) async {
    List<SiteModel>? urls = await DirectLink.check(url);
    if (urls == null) return null;

    for (SiteModel siteData in urls) {
      if (siteData.quality == quality) {
        return siteData.link;
      }
    }
    if (urls.isNotEmpty) {
      return urls[0].link;
    }
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
