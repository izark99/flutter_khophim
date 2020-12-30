import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieChapterList extends StatelessWidget {
  final List<String> detailChapterTitleList;
  final List<String> detailChapterLinkList;

  const MovieChapterList({
    Key key,
    @required this.detailChapterTitleList,
    @required this.detailChapterLinkList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_ALL_05,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          itemCount: detailChapterTitleList.length,
          itemBuilder: (BuildContext context, int index) {
            return GetBuilder<DataController>(
              init: DataController(),
              builder: (_) {
                return FlatButton(
                  color: _.index == index
                      ? Colors.lightBlue
                      : Theme.of(context).accentColor,
                  onPressed: () {
                    _.changeChapter(index);
                  },
                  child: Text(
                    detailChapterTitleList[index]
                        .toString()
                        .replaceAll("Thuyết Minh", " TM"),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                );
              },
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: CROSS_GRIDVIEW_CHAPTER,
            mainAxisSpacing: SPACING_05,
            crossAxisSpacing: SPACING_05,
            childAspectRatio: ASPECT_RATIO_GRIDVIEW_CHAPTER,
          ),
        ),
      ),
    );
  }
}
