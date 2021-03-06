import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:khophim/views/widget/loading.dart';
import 'package:khophim/views/widget/movie_chapter_list.dart';
import 'package:khophim/views/widget/movie_image.dart';
import 'package:khophim/views/widget/movie_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khophim/views/widget/player.dart';

class MovieUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DataController>(
          init: DataController(),
          builder: (_) {
            if (_.detailName.length > 0) {
              return OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return Column(
                    children: [
                      Visibility(
                        visible: orientation == Orientation.portrait,
                        child: MovieTitle(detailName: _.detailName),
                      ),
                      _.detailChapterTitleList.length > 0
                          ? Player()
                          : MovieImage(detailImage: _.detailImage),
                      Visibility(
                        visible: orientation == Orientation.portrait,
                        child: SIZED_BOX_H10,
                      ),
                      Visibility(
                        visible: orientation == Orientation.portrait,
                        child: Center(
                          child: Text(
                            _.detailChapterTitleList.length > 0
                                ? STR_LIST_CHAPTER
                                : STR_LIST_CHAPTER_EMPTY,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _.detailChapterTitleList.length > 0 &&
                            orientation == Orientation.portrait,
                        child: Expanded(
                          child: MovieChapterList(
                            detailChapterLinkList: _.detailChapterLinkList,
                            detailChapterTitleList: _.detailChapterTitleList,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: orientation == Orientation.portrait,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              STR_SHOW_TIME +
                                  _.detailShowtime.trim().toUpperCase(),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}
