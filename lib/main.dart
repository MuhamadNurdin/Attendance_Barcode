import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:meditation_app/common/api_factory/dio_factory.dart';
import 'package:meditation_app/common/app.dart';
import 'package:meditation_app/common/config/dependencies.dart';
import 'package:meditation_app/common/config/prefs/pref_utils.dart';
// import 'package:meditation_app/screens/login_signup.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/authentication/views/signin.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';
import 'package:meditation_app/src/profile/account/account_screen.dart';
import 'package:meditation_app/src/profile/datadiri/data_diri_view.dart';
import 'package:meditation_app/src/profile/datakaryawan/profile_main.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  // Controller dependencies which we use throughout the app
  Dependencies.injectDependencies();

  DioFactory.initialiseHeaders(await PrefUtils.getToken());

  bool isLoggedIn = await PrefUtils.getIsLoggedIn();
  runApp(App(isLoggedIn));
  // runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rynest Attendance',
      theme: ThemeData(
          primaryColor: mainColor, scaffoldBackgroundColor: Colors.white),
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset("assets/icons/logogrm.svg"),
        splashIconSize: 200,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: IntroScreen(),
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => IntroScreen(),
        '/': (context) => HomeScreen(),
        '/login': (context) => SignIn(),
        // '/reg': (context) => Registration(),
        // '/dashboard': (context) => Dashboard(),
        // '/contact': (context) => ContactPage(),
        '/profile': (context) => AccountPageEdited(),
        '/resultdatadiri': (context) => DataDiriView(),
        // '/camfront': (context) => CameraScreen(),
      },
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

// ------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      // ignore: unnecessary_new
      new Slide(
        title: "Global Risk Management",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Are you concerned about energy price risk, but it is not a core focus for your operations? Never taking risks, you don’t fully understand, is intelligent risk management.",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        centerWidget: const Text("", style: TextStyle(color: Colors.white)),
        backgroundImage: "assets/images/grm-build.png",
        // widthImage: 300,
        // heightImage: 800,
        backgroundImageFit: BoxFit.fill,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Global Risk Management",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            // ignore: unnecessary_const
            color: const Color(0xff7FFFD4),
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'RobotoMono'),
        description:
            "Working with GRM can help you bridge the knowledge gap. We have provided energy risk management solutions to clients globally for over 15 years and are part of a worldwide shipping and bunkering group. We have experience, expertise, and a commitment to our clients because we believe that risk management is as much about people as models.",
        styleDescription: const TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/images/slider01.png",
        backgroundImageFit: BoxFit.fill,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "GRM Attendance",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Through our derivatives expertise and participation in global energy and emissions markets, our mission is to provide consumers and producers of energy commodities the ability to identify and manage all energy price risks inherent within their operations.",
        styleDescription: const TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/images/slider02.png",
        backgroundImageFit: BoxFit.fill,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 15,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: const Color(0x33FFA8B0),
      colorActiveDot: const Color(0xffFFA8B0),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
    );
  }
}
