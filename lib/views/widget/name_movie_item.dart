import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';

class NameMovieItem extends StatelessWidget {
  final String name;

  const NameMovieItem({Key key, @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PAD_SYM_H05,
      height: NAME_MOVIE_ITEM_SIZE,
      color: Theme.of(context).canvasColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Theme.of(context).accentColor),
            textAlign: TextAlign.center,
          ),
          SIZED_BOX_H05,
        ],
      ),
    );
  }
}
