import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String detailName;

  const MovieTitle({Key key, @required this.detailName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PAD_ALL_05,
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Text(
          detailName.toUpperCase(),
          style: Theme.of(context).textTheme.headline4,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
