import 'package:cached_flick_video_player/flick_video_player.dart';
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
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9 / 16,
          child: FlickVideoPlayer(
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
              videoFit: BoxFit.contain,
              controls: FlickLandscapeControls(),
            ),
          ),
        );
      },
    );
  }
}
