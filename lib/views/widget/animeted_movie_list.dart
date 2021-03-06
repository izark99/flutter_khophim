import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.dart';
import 'movie_item.dart';

class AnimetedMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (_) {
        if (_.animatedMovieNameList.length > 0) {
          return Padding(
            padding: PAD_SYM_H05,
            child: GridView.builder(
              controller: _.scrollAnimatedMovieList,
              itemCount: _.getLength(_.animatedMovieNameList.length),
              itemBuilder: (context, index) {
                return MovieItem(
                  name: _.animatedMovieNameList[index],
                  image: _.animatedMovieImageList[index],
                  link: _.animatedMovieLinkList[index],
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
