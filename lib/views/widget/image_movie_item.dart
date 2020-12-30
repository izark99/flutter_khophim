import 'package:khophim/helpers/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageMovieItem extends StatelessWidget {
  final String image;
  const ImageMovieItem({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PAD_ALL_05,
      color: Theme.of(context).canvasColor,
      child: CachedNetworkImage(
        imageUrl: image,
        width: 300,
        height: 450,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error, size: ICON_SIZE_H3),
        ),
      ),
    );
  }
}
