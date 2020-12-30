import 'package:khophim/helpers/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  final detailImage;

  const MovieImage({Key key, @required this.detailImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Theme.of(context).accentColor,
          padding: PAD_ALL_05,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: detailImage,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 270 / 480,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
