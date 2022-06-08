import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_pengalamankerja.dart';

class DataPengalamanKerja extends StatefulWidget {
  const DataPengalamanKerja({Key? key}) : super(key: key);

  @override
  _DataPengalamanKerjaState createState() => _DataPengalamanKerjaState();
}

class _DataPengalamanKerjaState extends State<DataPengalamanKerja> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final namaperusahaanriwayatPekerjaanController1 = TextEditingController();
  final daririwayatPekerjaanController1 = TextEditingController();
  final sampairiwayatPekerjaanController1 = TextEditingController();
  final alamatriwayatPekerjaanController1 = TextEditingController();
  final jabatanriwayatPekerjaanController1 = TextEditingController();
  final namadirekturriwayatPekerjaanController1 = TextEditingController();
  final alasanberhentiriwayatPekerjaanController1 = TextEditingController();

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
                      Text('Nama Perusahaan : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            namaperusahaanriwayatPekerjaanController1.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Dari '),
                        const SizedBox(width: 1),
                        Text(daririwayatPekerjaanController1.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Sampai '),
                        const SizedBox(width: 1),
                        Text(sampairiwayatPekerjaanController1.text),
                      ]),
                      const SizedBox(height: 10),
                      Text('Nama Perusahaan : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            alamatriwayatPekerjaanController1.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Jabatan : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            jabatanriwayatPekerjaanController1.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Direktur: '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            namadirekturriwayatPekerjaanController1.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Alasan Resign : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            alasanberhentiriwayatPekerjaanController1.text,
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const SizedBox(width: 70),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Get.to(PengalamanKerjaResult());
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

  DateTime _dateTime1 = DateTime.now();
  var _daritodoDateController1 = TextEditingController();
  Future _dariselectedTodoDate1(BuildContext context) async {
    var _pickedDate1 = await showDatePicker(
      context: context,
      initialDate: _dateTime1,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (_pickedDate1 != null) {
      setState(() {
        _dateTime1 = _pickedDate1;
        _daritodoDateController1.text =
            DateFormat('d-MM-yyyy').format(_pickedDate1);
      });
    }
  }

  DateTime _dateTime11 = DateTime.now();
  var _sampaitodoDateController11 = TextEditingController();
  Future _sampaiselectedTodoDate11(BuildContext context) async {
    var _pickedDate11 = await showDatePicker(
      context: context,
      initialDate: _dateTime11,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (_pickedDate11 != null) {
      setState(() {
        _dateTime11 = _pickedDate11;
        _sampaitodoDateController11.text =
            DateFormat('d-MM-yyyy').format(_pickedDate11);
      });
    }
  }

  //dari sampai 1

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Data Pengalaman Kerja",
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
                              TextSpan(text: 'Nama Perusahaan '),
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
                              "assets/icons/nama_perusahaan.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: namaperusahaanriwayatPekerjaanController1,
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
                              hintText: "Masukan Nama Perusahaan 1",
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
                              TextSpan(text: 'Dari '),
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
                              _dariselectedTodoDate1(context);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/dari.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: true,
                          controller: _daritodoDateController1,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value != null && value.trim().length < 2) {
                              return 'This field requires a minimum of 2 characters';
                            }

                            return null;
                          },
                          onTap: () {
                            _dariselectedTodoDate1(context);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Click Icon Calender",
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
                              TextSpan(text: 'Sampai '),
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
                              _sampaiselectedTodoDate11(context);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/sampai.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: true,
                          controller: _sampaitodoDateController11,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value != null && value.trim().length < 2) {
                              return 'This field requires a minimum of 2 characters';
                            }

                            return null;
                          },
                          onTap: () {
                            _sampaiselectedTodoDate11(context);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Click Icon Calender",
                              hintStyle: hintFontStyle),
                        )),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //dari sampai 1

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
                              TextSpan(text: 'Alamat '),
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
                              "assets/icons/alamat.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          readOnly: true,
                          controller: alamatriwayatPekerjaanController1,
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
                              hintText: "Masukan Nama Alamat",
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
                              TextSpan(text: 'Jabatan '),
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
                              "assets/icons/jabatan.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: jabatanriwayatPekerjaanController1,
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
                              hintText: "Masukan Jabatan ",
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
                              TextSpan(text: 'Nama Direktur '),
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
                              "assets/icons/nama_direktur.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: namadirekturriwayatPekerjaanController1,
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
                              hintText: "Masukan Nama Direktur",
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
                              TextSpan(text: 'Alasan Resign '),
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
                              "assets/icons/alasan_resign.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: alasanberhentiriwayatPekerjaanController1,
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
                              hintText: "Masukan Alasan Resign",
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
