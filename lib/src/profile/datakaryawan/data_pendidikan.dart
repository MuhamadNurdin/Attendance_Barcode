import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_data_pendidikan.dart';

class DataPendidikan extends StatefulWidget {
  const DataPendidikan({Key? key}) : super(key: key);

  @override
  _DataPendidikanState createState() => _DataPendidikanState();
}

class _DataPendidikanState extends State<DataPendidikan> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final sdDataPendidikanController = TextEditingController();
  final sltpDataPendidikanController = TextEditingController();
  final smusmkDataPendidikanController = TextEditingController();
  final akademiDataPendidikanController = TextEditingController();
  final universitasDataPendidikanController = TextEditingController();
  final universitaslanjutanDataPendidikanController = TextEditingController();
  final universitaslanjutanlagiDataPendidikanController =
      TextEditingController();

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
                        Text('SD '),
                        const SizedBox(width: 1),
                        Text(sdDataPendidikanController.text)
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('SLTP '),
                        const SizedBox(width: 1),
                        Text(sltpDataPendidikanController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('SMU/SMK '),
                        const SizedBox(width: 1),
                        Text(smusmkDataPendidikanController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Akademi '),
                        const SizedBox(width: 1),
                        Text(akademiDataPendidikanController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Universitas '),
                        const SizedBox(width: 1),
                        Text(universitasDataPendidikanController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Universitas Lanjutan /S2 '),
                        const SizedBox(width: 1),
                        Text(universitaslanjutanDataPendidikanController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Universitas Lanjutan /S3 '),
                        const SizedBox(width: 1),
                        Text(universitaslanjutanlagiDataPendidikanController
                            .text),
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
                              Get.to(DataPendidikan());
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Get.to(ViewDataPendidikan());
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

  DateTime _dateTime = DateTime.now();
  var _todoDateController = TextEditingController();
  Future _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('d-MM-yyyy').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "     Edit Data Pendidikan",
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                              TextSpan(text: 'SD'),
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
                              "assets/icons/sd.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: sdDataPendidikanController,
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
                              hintText: "Masukan Nama SD",
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
                              TextSpan(text: 'SLTP'),
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
                              "assets/icons/sltp.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: sltpDataPendidikanController,
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
                              hintText: "Masukan Nama SLTP ",
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
                              TextSpan(text: 'SMU/SMK'),
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
                              "assets/icons/smu_smk.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: smusmkDataPendidikanController,
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
                              hintText: "Masukan Nama SMU/SMK",
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
                              TextSpan(text: 'Akademi'),
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
                              "assets/icons/akademi.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: true,
                          controller: akademiDataPendidikanController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value != null && value.trim().length < 2) {
                              return 'This field requires a minimum of 2 characters';
                            }

                            return null;
                          },
                          // onTap: () {
                          //   _selectedTodoDate(context);
                          //   FocusScope.of(context)
                          //       .requestFocus(new FocusNode());
                          // },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Masukan Nama Akademi",
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
                              TextSpan(text: 'Unversitas'),
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
                              "assets/icons/udin-97.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: universitasDataPendidikanController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.streetAddress,
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
                              hintText: "Masukan Nama Universitas ",
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
                              TextSpan(text: 'Unversitas Lanjutan'),
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
                              "assets/icons/univ_lanjutan.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller:
                              universitaslanjutanDataPendidikanController,
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
                              hintText: "Masukan Nama Universitas Lanjutan",
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
                              TextSpan(text: 'Universitas Lanjutan Lainnya'),
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
                              "assets/icons/univ_lanjutan_lainnya.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller:
                              universitaslanjutanlagiDataPendidikanController,
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
                              hintText:
                                  "Masukan Nama Universitas Lanjutan Lainnya ",
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
                        primary: Color(0xFF45C2E3), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      // padding: EdgeInsets.symmetric(
                      //     vertical: 10, horizontal: 10),

                      onPressed: _saveForm,
                      child: Text(
                        "Save Data",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
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
