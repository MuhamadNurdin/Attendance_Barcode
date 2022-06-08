import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_data_pendidikan.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmnewPasswordController = TextEditingController();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Scrollbar(
            thickness: 10,
            isAlwaysShown: true,
            radius: Radius.circular(10),
            child: Container(
              height: 300,
              width: 500,
              child: ListView(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(children: [
                        Text('Old Password '),
                        const SizedBox(width: 1),
                        Text(oldPasswordController.text)
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('New Password '),
                        const SizedBox(width: 1),
                        Text(newPasswordController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Confirm New Password '),
                        const SizedBox(width: 1),
                        Text(confirmnewPasswordController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const SizedBox(width: 70),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              Get.to(NewPassword());
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Get.to(HomeScreen());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ));
        });
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Got a valid input');
      }
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF45C2E3),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/reset_pasword.png',
                  height: size.width * 0.5,
                  width: size.width * 0.8,
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
                              TextSpan(text: 'Old Password '),
                              TextSpan(
                                  text: '*',
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
                        color: Color(0xFFE7FAFF),
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
                              "assets/icons/old_password.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: oldPasswordController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 3) {
                              return 'This field requires a minimum of 3 characters';
                            }

                            return null;
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Masukan Password Lama",
                              hintStyle: hintFontStyle),
                        )),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                              TextSpan(text: 'New Password '),
                              TextSpan(
                                  text: '*',
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
                        color: Color(0xFFE7FAFF),
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
                              "assets/icons/new_password.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: newPasswordController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value != null && value.trim().length < 2) {
                              return 'This field requires a minimum of 16 characters';
                            }

                            return null;
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Masukan Password Baru ",
                              hintStyle: hintFontStyle),
                        )),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                              TextSpan(text: 'Confirm Password Baru '),
                              TextSpan(
                                  text: '*',
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
                        color: Color(0xFFE7FAFF),
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
                              "assets/icons/confirm_password.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: confirmnewPasswordController,
                          validator: (value) {
                            if (value != null && value.trim().length < 2) {
                              return 'This field requires a minimum of 2 characters';
                            }

                            return null;
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Confirm Password Baru",
                              hintStyle: hintFontStyle),
                        )),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.45,
                  height: size.height * 0.075,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00DDEB), // background
                          onPrimary: Colors.white, // foreground
                        ),
                        // padding: EdgeInsets.symmetric(
                        //     vertical: 10, horizontal: 10),
                        // color: mainColor,
                        onPressed: _saveForm,
                        child: Text(
                          "Save Data",
                          style: quicksandFontStyle.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
