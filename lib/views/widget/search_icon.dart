import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: PAD_ALL_05,
              color: Theme.of(context).accentColor,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: ICON_SIZE_H3 - 10,
                    color: Theme.of(context).canvasColor,
                  ),
                  Text(
                    STR_SEARCH_ICON,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Get.toNamed("/SEARCH"),
        ),
        SIZED_BOX_W20,
      ],
    );
  }
}
