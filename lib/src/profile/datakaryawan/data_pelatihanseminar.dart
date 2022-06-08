import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_pelatihanseminar.dart';

class DataPelatihanSeminar extends StatefulWidget {
  const DataPelatihanSeminar({Key? key}) : super(key: key);

  @override
  _DataPelatihanSeminarState createState() => _DataPelatihanSeminarState();
}

class _DataPelatihanSeminarState extends State<DataPelatihanSeminar> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final bidangjenisseminarController = TextEditingController();
  final penyelenggaraseminarController = TextEditingController();
  final tempatkotaseminarController = TextEditingController();
  final jurusanseminarController = TextEditingController();
  final berijazadahtidakseminarController = TextEditingController();
  final lulustidakseminarController = TextEditingController();

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bidang / Jenis Seminar Kursus :',
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 10),
                      Container(
                          width: 490,
                          child: Text(
                            bidangjenisseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Penyelenggara :'),
                      const SizedBox(width: 10),
                      Container(
                          width: 490,
                          child: Text(
                            penyelenggaraseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Tempat / Kota Dilaksanakan :'),
                      const SizedBox(width: 10),
                      Container(
                          width: 490,
                          child: Text(
                            tempatkotaseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Jurusan Seminar Kursus :'),
                      const SizedBox(width: 10),
                      Container(
                          width: 490,
                          child: Text(
                            jurusanseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Berijazah / Tidak Berijazah :'),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            berijazadahtidakseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Lulus / Tidak: '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            lulustidakseminarController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const SizedBox(width: 60),
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
                              Get.to(PelatihanSeminarResult());
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
          "Data Pelatihan & Seminar",
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
                              TextSpan(text: 'Bidang / Jenis '),
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
                              "assets/icons/bidang.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: bidangjenisseminarController,
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
                              hintText: "Masukan Bidang / Jenis ",
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
                              TextSpan(text: 'Penyelenggara '),
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
                              "assets/icons/penyelenggara.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: penyelenggaraseminarController,
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
                              hintText: "Masukan Penyeleggara",
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
                              TextSpan(text: 'Tempat / Kota Dilaksanakan '),
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
                              "assets/icons/tempat.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: tempatkotaseminarController,
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
                              hintText: "Masukan Tempat / Kota Pelaksanaan",
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
                              TextSpan(text: 'Jurusan Seminar '),
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
                              "assets/icons/jurusan_seminar.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: jurusanseminarController,
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
                              hintText: "Masukan Jurusan",
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
                              TextSpan(text: 'Berijazah / Tidak Berijazah '),
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
                              "assets/icons/ijazah_tidak.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: berijazadahtidakseminarController,
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
                              hintText: "Masukan Ya / Tidak",
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
                              TextSpan(text: 'Lulus / Tidak '),
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
                              "assets/icons/lulus_tidak.svg",
                              width: size.width * 0.1,
                              height: size.height * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: lulustidakseminarController,
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
                              hintText: "Masukan Lulus / Tidak",
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
