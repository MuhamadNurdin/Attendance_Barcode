part of 'shared.dart';

Color mainColor = const Color(0xFF45C2E3);
Color secondColor = const Color(0xFFEBB31F);
Color greyColor = const Color(0xFFF1F3F6);
Color redColor = RadialGradient(
  center: Alignment.topLeft,
  radius: 0.5,
  colors: [
    Color.fromRGBO(121, 40, 202, 30),
    Color.fromRGBO(0, 112, 243, 30),
  ],
) as Color;

Widget loadingIndicator = SpinKitHourGlass(color: mainColor);

TextStyle blackFontStyle = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
TextStyle blackFontStylee = GoogleFonts.quicksand()
    .copyWith(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle blackFontStyle2 = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
TextStyle blackFontStyle3 = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle greyFontStyle =
    GoogleFonts.quicksand().copyWith(color: const Color(0xFFCACFD5));
TextStyle blueFontStyle = GoogleFonts.quicksand().copyWith(
    fontSize: 13, fontWeight: FontWeight.bold, color: const Color(0xFF45C2E3));
TextStyle amberFontStyle = GoogleFonts.quicksand()
    .copyWith(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.amber);
TextStyle cairoFontStyle = GoogleFonts.cairo();
TextStyle quicksandFontStyle = GoogleFonts.quicksand();
TextStyle mainButton = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold);

TextStyle dropFontStyle = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold);
TextStyle dropFontStyle2 = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold);
TextStyle hintFontStyle = GoogleFonts.quicksand()
    .copyWith(color: Colors.black38, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle idicatorFontStyle =
    GoogleFonts.quicksand().copyWith(fontSize: 8, fontWeight: FontWeight.w400);
const double defaultMargin = 24;
const double defaultMargin2 = 23;

TextStyle pendingStyle = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);
