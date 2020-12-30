import 'package:khophim/controllers/controller.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:khophim/views/widget/animeted_movie_list.dart';
import 'package:khophim/views/widget/app_name.dart';
import 'package:khophim/views/widget/recommend_list.dart';
import 'package:khophim/views/widget/search_icon.dart';
import 'package:khophim/views/widget/theater_movie_list.dart';
import 'package:khophim/views/widget/tv_series_list.dart';
import 'package:khophim/views/widget/tv_show_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeUI extends StatelessWidget {
  final Controller controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context: context),
      body: Obx(
        () => _buildBody(context: context, tab: controller.tabIndex),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context: context),
    );
  }
}

AppBar _buildAppBar({@required BuildContext context}) {
  return AppBar(
    elevation: 0,
    title: AppName(),
    actions: [
      SearchIcon(),
    ],
  );
}

Widget _buildBody({@required BuildContext context, @required int tab}) {
  switch (tab) {
    case 0:
      return RecommendList();
      break;
    case 1:
      return TVSeriesList();
      break;
    case 2:
      return MovieTheaterList();
      break;
    case 3:
      return AnimetedMovieList();
      break;
    case 4:
      return TVShowList();
      break;
    default:
      return RecommendList();
  }
}

Widget _buildBottomNavigationBar({@required BuildContext context}) {
  final Controller controller = Get.find<Controller>();
  return Obx(
    () => Padding(
      padding: PAD_SYM_H10,
      child: GNav(
        gap: 4,
        textStyle: Theme.of(context).textTheme.bodyText1,
        iconSize: ICON_SIZE_H3M,
        padding: PAD_SYM_H12_W03,
        tabMargin: PAD_SYM_V10,
        color: Theme.of(context).accentColor,
        activeColor: Theme.of(context).accentColor,
        duration: Duration(milliseconds: 800),
        tabBackgroundColor: Theme.of(context).accentColor.withOpacity(0.1),
        tabs: [
          GButton(
            icon: Icons.star,
            text: STR_RECOMMEND_BTN_NAV,
          ),
          GButton(
            icon: Icons.movie_sharp,
            text: STR_TV_SERIES_BTN_NAV,
          ),
          GButton(
            icon: Icons.theaters,
            text: STR_THEATER_MOVIE_BTN_NAV,
          ),
          GButton(
            icon: Icons.toys,
            text: STR_ANIMATED_MOVIE_BTN_NAV,
          ),
          GButton(
            icon: Icons.ondemand_video_sharp,
            text: STR_TV_SHOW_BTN_NAV,
          ),
        ],
        selectedIndex: controller.tabIndex,
        onTabChange: (newIndex) => controller.changeTabIndex(newIndex),
      ),
    ),
  );
}
