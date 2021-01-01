import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/ad_manager.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_movie_item.dart';
import 'name_movie_item.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final String name;
  final String link;

  const MovieItem({
    Key key,
    @required this.link,
    @required this.name,
    @required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DataController dataController = Get.find<DataController>();
        dataController.clearMovieInfo();
        dataController.loadDetail(link);
        AdManager().showIntertitialAd();
        Get.toNamed("/MOVIE");
      },
      child: Container(
        padding: PAD_ALL_01,
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Expanded(child: ImageMovieItem(image: image)),
            NameMovieItem(name: name),
          ],
        ),
      ),
    );
  }
}
