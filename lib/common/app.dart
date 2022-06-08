import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/dio_factory.dart';
import 'package:meditation_app/common/config/app_colors.dart';
import 'package:meditation_app/common/config/app_fonts.dart';
import 'package:meditation_app/common/config/config.dart';
import 'package:meditation_app/common/config/localization/translations.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';
// import 'package:meditation_app/screens/login_signup.dart';
import 'package:meditation_app/src/authentication/views/signin.dart';
// import 'package:odoo_common_code_latest/src/authentication/views/signin.dart';
// import 'package:odoo_common_code_latest/src/home/view/home.dart';

class App extends StatefulWidget {
  final bool isLoggedIn;

  App(this.isLoggedIn);

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  var _initStateFlag = false;

  @override
  void initState() {
    super.initState();
    if (!kReleaseMode) {
      log('initState', name: '_AppState::initState');
    }
    _initStateFlag = true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_initStateFlag) {
      _initStateFlag = false;
      await DioFactory.computeDeviceInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.orangeThemeColor,
        fontFamily: AppFont.Roboto_Regular,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Global Risk Management',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Config.supportedLocales,
      home: widget.isLoggedIn ? HomeScreen() : SignIn(),
    );
  }
}
