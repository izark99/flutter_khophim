import 'package:khophim/controllers/data_controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:khophim/views/widget/search_list.dart';
import 'package:khophim/views/widget/search_text_field.dart';
import 'package:khophim/views/widget/search_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Padding(
            padding: PAD_ALL_10,
            child: GetBuilder<DataController>(
              init: DataController(),
              builder: (_) {
                return Column(
                  children: [
                    SearchTitle(),
                    SIZED_BOX_H10,
                    Expanded(child: SearchList()),
                    SIZED_BOX_H10,
                    SearchTextField(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
