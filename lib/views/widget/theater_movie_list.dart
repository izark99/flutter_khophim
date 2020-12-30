import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';
import 'movie_item.dart';

class MovieTheaterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (_) {
        if (_.movieTheaterNameList.length > 0) {
          return Padding(
            padding: PAD_SYM_H05,
            child: GridView.builder(
              controller: _.scrollMovieTheaterList,
              itemCount: _.getLength(_.movieTheaterNameList.length),
              itemBuilder: (context, index) {
                return MovieItem(
                  name: _.movieTheaterNameList[index],
                  image: _.movieTheaterImageList[index],
                  link: _.movieTheaterLinkList[index],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: CROSS_GRIDVIEW,
                mainAxisSpacing: SPACING_05,
                crossAxisSpacing: SPACING_05,
                childAspectRatio: ASPECT_RATIO_GRIDVIEW,
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
