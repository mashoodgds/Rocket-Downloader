import 'package:get/get.dart';

class Screencontroller extends GetxController {
  double DownloadProgress = 0.0;
  var progress = 0.obs;
  updateDownloadProgress(num progress) {
    DownloadProgress = double.parse("$progress");
    update();
  }

  updateYtProgress(progress) async* {
    DownloadProgress = progress;
    update();
  }
}
