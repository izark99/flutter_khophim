import 'package:cached_flick_video_player/flick_video_player.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:khophim/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

class DataController extends GetxController {
  ScrollController scrollRecommendList = ScrollController();
  ScrollController scrollTVSeriesList = ScrollController();
  ScrollController scrollMovieTheaterList = ScrollController();
  ScrollController scrollAnimatedMovieList = ScrollController();
  ScrollController scrollTVShowList = ScrollController();
  ScrollController scrollSearchList = ScrollController();
  TextEditingController searchText = TextEditingController();

  String keySearch;
  int pageTVSeriesList = 1;
  int pageMovieTheaterList = 1;
  int pageAnimatedMovieList = 1;
  int pageTVShowList = 1;
  int pageSearchList = 1;

  getLength(int length) {
    int newLength;
    for (int i = 0; i < length; i++) {
      if (i % CROSS_GRIDVIEW == 0) {
        newLength = i;
      }
    }
    return newLength;
  }

  void showPopUpDonate() async {
    await Future.delayed(Duration(seconds: 3));
    Get.defaultDialog(
      radius: 20,
      title: "ỦNG HỘ TÁC GIẢ",
      backgroundColor: Colors.white,
      titleStyle: Get.theme.textTheme.headline4.copyWith(color: Colors.black87),
      content: Text(
        "Ứng dụng được phát triển bởi Izark Nguyễn. Nếu bạn thích nó, hãy Donate cho mình <3",
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.bodyText1.copyWith(color: Colors.black87),
      ),
      actions: [
        GestureDetector(
          onTap: () async {
            String url = "https://nhantien.momo.vn/khophim";
            await launch(url);
          },
          child: Text(">> Donate qua MOMO <<",
              style: Get.theme.textTheme.bodyText1
                  .copyWith(color: Colors.black87)),
        )
      ],
    );
  }

  void _scrollTVSeriesListener() {
    if (scrollTVSeriesList.offset >=
            scrollTVSeriesList.position.maxScrollExtent &&
        !scrollTVSeriesList.position.outOfRange) {
      loadMoreTVSeriesList(pageTVSeriesList);
      pageTVSeriesList++;
    }
  }

  void _scrollMovieTheaterListener() {
    if (scrollMovieTheaterList.offset >=
            scrollMovieTheaterList.position.maxScrollExtent &&
        !scrollMovieTheaterList.position.outOfRange) {
      loadMoreMovieTheaterList(pageMovieTheaterList);
      pageMovieTheaterList++;
    }
  }

  void _scrollAnimatedMovieListener() {
    if (scrollAnimatedMovieList.offset >=
            scrollAnimatedMovieList.position.maxScrollExtent &&
        !scrollAnimatedMovieList.position.outOfRange) {
      loadMoreAnimatedMovieList(pageAnimatedMovieList);
      pageAnimatedMovieList++;
    }
  }

  void _scrollTVShowListener() {
    if (scrollTVShowList.offset >= scrollTVShowList.position.maxScrollExtent &&
        !scrollTVShowList.position.outOfRange) {
      loadMoreTVShowList(pageTVShowList);
      pageTVShowList++;
    }
  }

  void _scrollSearchListener() {
    if (scrollSearchList.offset >= scrollSearchList.position.maxScrollExtent &&
        !scrollSearchList.position.outOfRange) {
      loadMoreSearchMovieList(pageSearchList);
      pageSearchList++;
    }
    if (scrollSearchList.position.keepScrollOffset) {
      FocusScope.of(Get.context).requestFocus(FocusNode());
    }
  }

  final webScraper = WebScraper('https://dongphym.net');

  List<String> recommendNameList = [];
  List<String> recommendLinkList = [];
  List<String> recommendImageList = [];
  Future<void> loadRecommendList() async {
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper
        .loadWebPage('/album/dong-de-cu-cho-ban_qTH59gYv.html')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        recommendNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        recommendLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        recommendImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  List<String> tvSeriesNameList = [];
  List<String> tvSeriesLinkList = [];
  List<String> tvSeriesImageList = [];
  Future<void> loadTVSeriesList() async {
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper.loadWebPage('/content/search?t=ft&mt=tvshow&nt=')) {
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        tvSeriesNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        tvSeriesLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        tvSeriesImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  void loadMoreTVSeriesList(int page) async {
    List<Map<String, dynamic>> _tempList = [];
    List<String> _tempListString = [];
    if (await webScraper
        .loadWebPage('/content/search?t=ft&nt=&mt=tvshow&p=$page')) {
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['title'],
        );
      }
      tvSeriesNameList += _tempListString;
      _tempListString.clear();
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['href'],
        );
      }
      tvSeriesLinkList += _tempListString;
      _tempListString.clear();
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      tvSeriesImageList += _tempListString;
      _tempListString.clear();
      _tempList.clear();
      update();
    }
  }

  List<String> movieTheaterNameList = [];
  List<String> movieTheaterLinkList = [];
  List<String> movieTheaterImageList = [];
  Future<void> loadMovieTheaterList() async {
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper.loadWebPage('/album/phim-chieu-rap_XAcsAQ9V.html')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        movieTheaterNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        movieTheaterLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        movieTheaterImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  void loadMoreMovieTheaterList(int page) async {
    List<Map<String, dynamic>> _tempList = [];
    List<String> _tempListString = [];
    if (await webScraper
        .loadWebPage('/album/phim-chieu-rap_XAcsAQ9V.html?p=$page')) {
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['title'],
        );
      }
      movieTheaterNameList += _tempListString;
      _tempListString.clear();
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['href'],
        );
      }
      movieTheaterLinkList += _tempListString;
      _tempListString.clear();
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      movieTheaterImageList += _tempListString;
      _tempListString.clear();
      _tempList.clear();
      update();
    }
  }

  List<String> animatedMovieNameList = [];
  List<String> animatedMovieLinkList = [];
  List<String> animatedMovieImageList = [];
  Future<void> loadAnimatedMovieList() async {
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper
        .loadWebPage('/album/phim-hoat-hinh-anime_Dp90aAN1.html')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        animatedMovieNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        animatedMovieLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        animatedMovieImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  void loadMoreAnimatedMovieList(int page) async {
    List<Map<String, dynamic>> _tempList = [];
    List<String> _tempListString = [];
    if (await webScraper
        .loadWebPage('/album/phim-hoat-hinh-anime_Dp90aAN1.html?p=$page')) {
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['title'],
        );
      }
      animatedMovieNameList += _tempListString;
      _tempListString.clear();
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['href'],
        );
      }
      animatedMovieLinkList += _tempListString;
      _tempListString.clear();
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      animatedMovieImageList += _tempListString;
      _tempListString.clear();
      _tempList.clear();
      update();
    }
  }

  List<String> tvShowNameList = [];
  List<String> tvShowLinkList = [];
  List<String> tvShowImageList = [];
  Future<void> loadTVShowList() async {
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper.loadWebPage('/album/tv-show_VrP3mgb5.html')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        tvShowNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        tvShowLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        tvShowImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  void loadMoreTVShowList(int page) async {
    List<Map<String, dynamic>> _tempList = [];
    List<String> _tempListString = [];
    if (await webScraper.loadWebPage('/album/tv-show_VrP3mgb5.html?p=$page')) {
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['title'],
        );
      }
      tvShowNameList += _tempListString;
      _tempListString.clear();
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['href'],
        );
      }
      tvShowLinkList += _tempListString;
      _tempListString.clear();
      _tempList = webScraper.getElement(
        'div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      tvShowImageList += _tempListString;
      _tempListString.clear();
      _tempList.clear();
      update();
    }
  }

  String detailName = "";
  List<String> detailChapterLinkList = [];
  List<String> detailChapterTitleList = [];
  String detailImage = "";
  String detailShowtime = "";
  String codeMovie = "";
  String codeChapter = "";
  FlickManager flickManager;
  int index;
  void loadDetail(String url) async {
    url = url.replaceAll('https://dongphym.net', "").trim();
    codeMovie = url.split("_")[1].split(".html")[0];
    index = 0;
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper.loadWebPage(url)) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.row > div.col-sm-4 > div.center > img',
        ['title'],
      );
      detailName = _tempList[0]['attributes']['title'].toString();
      _tempList.clear();
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.row > div.col-sm-4 > div.center > img',
        ['data-original'],
      );
      detailImage = _tempList[0]['attributes']['data-original'].toString();
      _tempList.clear();
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.row > div.col-sm-8 > div.air_date > p',
        [],
      );
      if (_tempList.isNotEmpty) {
        detailShowtime = _tempList[0]['title'].toString();
      } else {
        detailShowtime = "KHÔNG CÓ THÔNG TIN";
      }
      _tempList.clear();
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div.row > div.col-sm-8 > div.movie-rate > div.rate-star > div.movie-eps-all > div.movie-eps-wrapper > a.movie-eps-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        detailChapterLinkList.add(_tempList[i]['attributes']['href']);
        detailChapterTitleList.add(_tempList[i]['attributes']['title']);
      }
      _tempList.clear();
      codeChapter =
          detailChapterLinkList[index].split("_")[1].split(".html")[0];
      flickManager = FlickManager(
        videoPlayerController: CachedVideoPlayerController.network(
            "https://asia00.fbcdn.space/rawhls/$codeMovie/$codeChapter-b2.m3u8?v="),
      );
      update();
    }
  }

  void changeChapter(int index) {
    this.index = index;
    codeChapter = detailChapterLinkList[index].split("_")[1].split(".html")[0];
    flickManager.handleChangeVideo(
      CachedVideoPlayerController.network(
          "https://asia00.fbcdn.space/rawhls/$codeMovie/$codeChapter-b2.m3u8?v="),
    );
    update();
  }

  List<String> searchMovieNameList = [];
  List<String> searchMovieLinkList = [];
  List<String> searchMovieImageList = [];
  Future<void> loadSearchMovieList(String v) async {
    keySearch = v;
    clearSearch();
    List<Map<String, dynamic>> _tempList = [];
    if (await webScraper.loadWebPage('/content/search?t=kw&q=$keySearch')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        searchMovieNameList.add(
          _tempList[i]['attributes']['title'],
        );
      }
      for (int i = 0; i < _tempList.length; i++) {
        searchMovieLinkList.add(
          _tempList[i]['attributes']['href'],
        );
      }
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        searchMovieImageList.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      _tempList.clear();
      update();
    }
  }

  void loadMoreSearchMovieList(int page) async {
    keySearch = keySearch.replaceAll(" ", "+");
    List<Map<String, dynamic>> _tempList = [];
    List<String> _tempListString = [];
    if (await webScraper
        .loadWebPage('/content/search?t=kw&q=$keySearch&p=$page')) {
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div > div.flex-wrap-movielist > a.movie-item',
        ['title', 'href'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['title'],
        );
      }
      searchMovieNameList += _tempListString;
      _tempListString.clear();
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['href'],
        );
      }
      searchMovieLinkList += _tempListString;
      _tempListString.clear();
      _tempList = webScraper.getElement(
        'div.wrapper > div.container > div > div.flex-wrap-movielist > a.movie-item > div.pl-carousel-img',
        ['data-original'],
      );
      for (int i = 0; i < _tempList.length; i++) {
        _tempListString.add(
          _tempList[i]['attributes']['data-original'],
        );
      }
      searchMovieImageList += _tempListString;
      _tempListString.clear();
      _tempList.clear();
      update();
    }
  }

  void clearMovieInfo() {
    detailChapterLinkList?.clear();
    detailChapterTitleList?.clear();
    detailName = "";
    detailImage = "";
    detailShowtime = "";
  }

  void clearSearch() {
    searchMovieNameList?.clear();
    searchMovieLinkList?.clear();
    searchMovieImageList?.clear();
  }

  @override
  void onReady() async {
    super.onReady();
    await loadRecommendList();
    showPopUpDonate();
    await loadTVSeriesList();
    await loadMovieTheaterList();
    await loadAnimatedMovieList();
    await loadTVShowList();
    scrollTVSeriesList.addListener(_scrollTVSeriesListener);
    scrollMovieTheaterList.addListener(_scrollMovieTheaterListener);
    scrollAnimatedMovieList.addListener(_scrollAnimatedMovieListener);
    scrollTVShowList.addListener(_scrollTVShowListener);
    scrollSearchList.addListener(_scrollSearchListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollRecommendList.dispose();
    scrollTVSeriesList.dispose();
    scrollMovieTheaterList.dispose();
    scrollAnimatedMovieList.dispose();
    scrollTVShowList.dispose();
    scrollSearchList.dispose();
    flickManager.dispose();
  }
}
