import 'package:downloader/features/facebook%20downloader/controller/facebok_downloader.dart';
import 'package:downloader/features/instadownloader/controller/instadownloader_controller.dart';
import 'package:downloader/features/vimeo/controller/vimeo_controller.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  // put your services here

  await Get.putAsync<VimeoDownlodController>(
      () async => VimeoDownlodController());
  await Get.putAsync<FacebookDownloaderController>(
      () async => FacebookDownloaderController());
  await Get.putAsync<InstaDownloaderController>(
      () async => InstaDownloaderController());
}
