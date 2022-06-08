import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/modules/authentication_module.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/constantmaterial/shared.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Image.asset(
              'assets/images/reset_pasword.png',
              height: size.width * 0.8,
              width: size.width * 0.8,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              'Reset password',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Your e-mail must be correcly & active.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: quicksandFontStyle.copyWith(
                            color: secondColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: 'Email'),
                          TextSpan(
                              text: '',
                              style: quicksandFontStyle.copyWith(
                                  color: redColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold))
                        ])),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.9,
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: greyColor,
                  ),
                  child: Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.01,
                      ),
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                        onTap: () {
                          // _selectedTodoDate(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/Settings.svg",
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                        ),
                      ),
                    ),
                    Flexible(
                        child: TextFormField(
                      controller: email,
                      cursorColor: Colors.black,
                      obscureText: _isVisible ? false : true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != null && value.trim().length < 3) {
                          return 'This field requires @ characters';
                        }

                        return null;
                      },
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => updateStatus(),
                              icon: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Masukan Email ",
                          hintStyle: hintFontStyle),
                    )),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (GetUtils.isEmail(email.text)) {
                    // showWarning("Silahkan cek email");
                    forgetPassword(email.text);
                  } else {
                    showWarningForce("Silahkan input email");
                  }
                });
              },
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
