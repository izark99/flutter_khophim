import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PAD_ALL_05,
      color: Theme.of(context).canvasColor,
      child: GetBuilder<DataController>(
        init: DataController(),
        builder: (_) {
          return Center(
            child: Text(
              _.searchText.text.length > 0
                  ? STR_SEARCH_RESULT +
                      " \"" +
                      _.searchText.text.toUpperCase() +
                      "\""
                  : STR_SEARCH_RESULT,
              style: Theme.of(context).textTheme.headline4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
