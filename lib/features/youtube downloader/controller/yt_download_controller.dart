import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:random_string/random_string.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTDownloadController {
  Future<File?> saveAudioFromYT(String url) async {
    try {
      String filterUrl = url.replaceAll("?feature=share", "");
      var yt = YoutubeExplode();
      Video video = await yt.videos.get(filterUrl);
      StreamManifest manifest =
          await yt.videos.streamsClient.getManifest(video.id);
      var file = await _writeAudioInStorage(
          yt, manifest.audioOnly.withHighestBitrate());
      yt.close();
      return file;
    } catch (e) {
      return null;
    }
  }

  Future<File?> saveVideoFromYT(String url) async {
    try {
      var yt = YoutubeExplode();
      String filterUrl = url.replaceAll("?feature=share", "");

      Video video = await yt.videos.get(url);
      StreamManifest manifest =
          await yt.videos.streamsClient.getManifest(video.id);

      var file = _writeVideoInStorage(
        yt,
        manifest.muxed.withHighestBitrate(),
      );

      yt.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  _writeVideoInStorage(YoutubeExplode yt, VideoStreamInfo streamInfo) async {
    try {
      String name = randomAlpha(15);
      Stream<List<int>> stream = yt.videos.streamsClient.get(streamInfo);

      var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
      File file = File("/${downloadsDirectoryPath!.path}/ YT_Video_$name.mp4");
      var fileStream = file.openWrite();

      await stream.pipe(fileStream);
      await fileStream.flush();
      await fileStream.close();
      return file;
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
      return null;
    }
  }
}

Future<File?> _writeAudioInStorage(
    YoutubeExplode yt, AudioOnlyStreamInfo streamInfo) async {
  try {
    String name = randomAlpha(15);
    var stream = yt.videos.streamsClient.get(streamInfo);
    var downloadsDirectoryPath = await DownloadsPath.downloadsDirectory();
    var file = File("/${downloadsDirectoryPath!.path}/ YT_Audio_$name.mp3");
    var fileStream = file.openWrite();
    await stream.pipe(fileStream);
    await fileStream.flush();
    await fileStream.close();
    return file;
  } catch (e) {
    Fluttertoast.showToast(msg: "$e");
    return null;
  }
}
