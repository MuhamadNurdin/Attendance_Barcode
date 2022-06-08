import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_data_keluarga.dart';

class DataKeluarga extends StatefulWidget {
  const DataKeluarga({Key? key}) : super(key: key);

  @override
  _DataKeluargaState createState() => _DataKeluargaState();
}

class _DataKeluargaState extends State<DataKeluarga> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameayahDataKeluargaController = TextEditingController();
  final namaibuDataKeluargaController = TextEditingController();
  final anak1DataKeluargaController = TextEditingController();
  final anak2DataKeluargaController = TextEditingController();
  final anak3DataKeluargaController = TextEditingController();
  final anakdstDataKeluargaController = TextEditingController();
  final statuskawinDataKeluargaController = TextEditingController();
  final pekerjaanDataKeluargaController = TextEditingController();
  final warganegaraDataKeluargaController = TextEditingController();

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
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Ayah: '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            nameayahDataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Ibu : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            namaibuDataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Anak ke -1 : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            anak1DataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Anak ke -2 : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            anak2DataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Anak ke -3 : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            anak3DataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Anak Seterusnya : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            anakdstDataKeluargaController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Status: '),
                        const SizedBox(width: 1),
                        Text(statuskawinDataKeluargaController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Pekerjaan: '),
                        const SizedBox(width: 1),
                        Text(pekerjaanDataKeluargaController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Pekerjaan: '),
                        const SizedBox(width: 1),
                        Text(warganegaraDataKeluargaController.text),
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
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Get.to(DataKeluargaView());
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
          "     Edit Data Keluarga",
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
                              TextSpan(text: 'Kepala Keluarga '),
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
                              "assets/icons/kepala_keluarga.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: nameayahDataKeluargaController,
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
                              hintText: "Masukan Nama ",
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
                              TextSpan(text: 'Nama Ibu '),
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
                              "assets/icons/nama_ibu.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: namaibuDataKeluargaController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 3) {
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
                              hintText: "Masukan Nama Ibu ",
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
                              TextSpan(text: 'Anak Ke - 1'),
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
                              "assets/icons/anak1.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: anak1DataKeluargaController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 3) {
                              return 'Anda Tidak Mempunyai Anak ke - 1';
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
                              hintText: "Masukan Nama Anak Pertama ",
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
                              TextSpan(text: 'Anak ke - 2 '),
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
                              "assets/icons/anak2.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: anak2DataKeluargaController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 16) {
                              return 'Anda Tidak Mempunyai Anak ke - 2';
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
                              hintText: "Masukan Nama Anak Kedua",
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
                              TextSpan(text: 'Anak ke - 3 '),
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
                              "assets/icons/anak3.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: anak3DataKeluargaController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 3) {
                              return 'Anda Tidak Mempunyai Anak ke - 3';
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
                              hintText: "Masukan Nama Anak Ketiga ",
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
                              TextSpan(text: 'Anak Selanjutnya '),
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
                              "assets/icons/anak_selanjutnya.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: anakdstDataKeluargaController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.trim().length < 3) {
                              return 'Anda Tidak Mempunyai Anak';
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
                              hintText: "Masukan Nama Anak Selanjutnya ",
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
                              TextSpan(text: 'Status '),
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
                              "assets/icons/status.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: statuskawinDataKeluargaController,
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
                              hintText: "Masukan Status ",
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
                              TextSpan(text: 'Pekerjaan '),
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
                              "assets/icons/pekerjaan.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: pekerjaanDataKeluargaController,
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
                              hintText: "Masukan Pekerjaan ",
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
                              TextSpan(text: 'Kewarganegaraan '),
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
                              "assets/icons/kewarganegaraan.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: warganegaraDataKeluargaController,
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
                              hintText: "Masukan Kewarganegaraan ",
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
