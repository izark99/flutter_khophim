import 'package:khophim/helpers/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class SplashUI extends StatefulWidget {
  @override
  _SplashUIState createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void splashDelay() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAndToNamed("/HOME");
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    splashDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context, version: _packageInfo.version),
    );
  }
}

Widget _buildBody({@required BuildContext context, @required String version}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildLogo(context: context),
      _buildVersion(context: context, version: version),
      SIZED_BOX_H05,
      Container(
        child: LinearProgressIndicator(),
        width: MediaQuery.of(context).size.width / 1.5,
      ),
      _buildAuthor(context: context),
    ],
  );
}

Widget _buildLogo({@required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.movie,
        size: ICON_SIZE_H1,
        color: Theme.of(context).accentColor,
      ),
      SIZED_BOX_W10,
      Text(
        "Kho Phim",
        style: Theme.of(context).textTheme.headline1,
      ),
    ],
  );
}

Widget _buildVersion(
    {@required BuildContext context, @required String version}) {
  return Text("VERSION " + version,
      style: Theme.of(context).textTheme.bodyText1);
}

Widget _buildAuthor({@required BuildContext context}) {
  return ColorizeAnimatedTextKit(
    textStyle: Theme.of(context).textTheme.headline2,
    text: ["make by Izark"],
    colors: [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ],
  );
}
