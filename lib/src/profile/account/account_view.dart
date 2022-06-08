import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/account/account_screen.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "     My Account",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        elevation: 0.0,
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfffafafa),
        leading: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: ImageIcon(
                AssetImage(
                  'assets/icons/exit_app.png',
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AccountPageEdited());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/person.png'),
                      backgroundColor: Color(0xff45C2E3),
                    ),
                    //USERNAME
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
                                  TextSpan(text: 'Username '),
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
                                  "assets/icons/username.svg",
                                  width: size.width * 0.01,
                                  height: size.height * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Muhamad Nurdin')
                          ]),
                        ),
                      ],
                    ),

                    //EMAIL
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
                                  TextSpan(text: 'Email '),
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
                                  "assets/icons/email.svg",
                                  width: size.width * 0.01,
                                  height: size.height * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('nurdin@mail.com')
                          ]),
                        ),
                      ],
                    ),
                    //PASSWORD
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
                                  TextSpan(text: 'Email '),
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
                                  "assets/icons/password.svg",
                                  width: size.width * 0.01,
                                  height: size.height * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('**********')
                          ]),
                        ),
                      ],
                    ),
                  ])))),
    );
  }
}
