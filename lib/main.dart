import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'helpers/binding.dart';
import 'helpers/constant.dart';
import 'helpers/theme_customed.dart';
import 'views/ui/home_ui.dart';
import 'views/ui/movie_ui.dart';
import 'views/ui/search_ui.dart';
import 'views/ui/splash_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(KhoPhimApp());
}

class KhoPhimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: STR_APP_NAME,
      debugShowCheckedModeBanner: false,
      initialRoute: "/SPLASH",
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: "/SPLASH",
          page: () => SplashUI(),
        ),
        GetPage(
          name: "/HOME",
          page: () => HomeUI(),
        ),
        GetPage(
          name: "/MOVIE",
          page: () => MovieUI(),
        ),
        GetPage(
          name: "/SEARCH",
          page: () => SearchUI(),
        ),
      ],
    );
  }
}
