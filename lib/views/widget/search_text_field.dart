import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (_) {
        return Padding(
          padding: PAD_SYM_H05,
          child: TextFormField(
            controller: _.searchText,
            style: Theme.of(context).textTheme.bodyText1,
            maxLength: SEARCH_LENGTH,
            onChanged: (v) => _.loadSearchMovieList(_.searchText.text),
            decoration: InputDecoration(
              hintText: STR_SEARCH_HINT,
              hintStyle: Theme.of(context).textTheme.bodyText1,
              helperStyle: Theme.of(context).textTheme.bodyText2,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
