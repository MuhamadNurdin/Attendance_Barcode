import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constantmaterial/shared.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String svgPath;
  final VoidCallback onPressed;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.svgPath,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
            color: Color(0xFFFE7FAFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(4, 8), blurRadius: 10, color: Colors.black26)
            ]),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              title,
              style: quicksandFontStyle.copyWith(
                  color: mainColor, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.12,
              child: SvgPicture.asset(
                svgPath,
              ),
            )
          ],
        ),
      ),
    );
  }
}
