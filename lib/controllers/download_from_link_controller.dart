import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:downloader/controllers/screen_controller.dart';
import 'package:downloader/controllers/youtube_download_conrtroller.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:video_url_validator/video_url_validator.dart';

class DownloadFromLinkController
    with MyInstaDownloader, YoutubeDownloadController {
  Future<File?> downloadVideoFromPlatform(String url) async {
    if (await Permission.storage.status.isDenied) {
      Fluttertoast.showToast(msg: "Permission is Denined");
      // return null;
    } else if (await Permission.storage.isRestricted) {
      Fluttertoast.showToast(msg: "Permission is restricted");
      // return null;
    }
    if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    } else if (await Permission.storage.request().isGranted) {
      // return null;
    }
    var validator = VideoURLValidator();
    if (validator.validateYouTubeVideoURL(url: url)) {
      String filterUrl = url.replaceAll("?feature=share", "");
      return await saveVideoFromYT(filterUrl);
    } else if (url.contains("instagram.com")) {
      return await downloadVideoFromInsta(url);
    } else {
      return await downloadFile(url);
    }
  }

  Future<File?> downloadFile(url) async {
    try {
      var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
      String name = randomAlpha(15);
      final file = File("/${downloadsDirectoryPath!.path}/ $name");

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
/////////////////////////////

//////////////////////////////////////////////////////
mixin MyInstaDownloader {
  Future<File?> downloadMp3FromInsta(String url) async {
    try {
      FlutterInsta flutterInsta = FlutterInsta();
      String? downloadLink = await flutterInsta.downloadReels(url);
      if (downloadLink != null) {
        var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
        String name = randomAlpha(15);
        final file =
            File("/${downloadsDirectoryPath!.path}/insta_video_$name.mp3");
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

      //URL
    } catch (e) {
      // change in production
      Fluttertoast.showToast(msg: "$e");
      return null;
    }
  }

  Future<File?> downloadVideoFromInsta(String url) async {
    try {
      FlutterInsta flutterInsta = FlutterInsta();
      String? downloadLink = await flutterInsta.downloadReels(url); //URL
      if (downloadLink != null) {
        var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
        String name = randomAlpha(15);
        final file =
            File("/${downloadsDirectoryPath!.path}/insta_video_$name.mp4");
        final response =
            await Dio().get(downloadLink, onReceiveProgress: (received, total) {
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
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      return null;
    }
  }
}
