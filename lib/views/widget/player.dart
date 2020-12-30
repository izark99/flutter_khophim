import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khophim/controllers/data_controller.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void dispose() {
    super.dispose();
    Get.find<DataController>().flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (_) {
        return FlickVideoPlayer(
          preferredDeviceOrientation: [
            DeviceOrientation.portraitUp,
          ],
          preferredDeviceOrientationFullscreen: [
            DeviceOrientation.landscapeLeft
          ],
          flickManager: _.flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            videoFit: BoxFit.fitWidth,
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            videoFit: BoxFit.fitHeight,
            controls: FlickLandscapeControls(),
          ),
        );
      },
    );
  }
}
