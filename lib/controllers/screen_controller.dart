import 'package:get/get.dart';

class Screencontroller extends GetxController {
  num DownloadProgress = 0;
  var progress = 0.obs;
  updateDownloadProgress(num progress) {
    DownloadProgress = progress;
    update();
  }

  updateYtProgress(progress) async* {
    DownloadProgress = progress;
    update();
  }
}
