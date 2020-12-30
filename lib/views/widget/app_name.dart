import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.movie,
          size: ICON_SIZE_H3,
        ),
        SIZED_BOX_W05,
        Text(
          STR_APP_NAME,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
