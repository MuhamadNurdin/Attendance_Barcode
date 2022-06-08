import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pelatihanseminar.dart';

class PelatihanSeminarResult extends StatefulWidget {
  const PelatihanSeminarResult({Key? key}) : super(key: key);

  @override
  _PelatihanSeminarResultState createState() => _PelatihanSeminarResultState();
}

class _PelatihanSeminarResultState extends State<PelatihanSeminarResult> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(DataPelatihanSeminar());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
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
                  child: Column(children: [
                    //Nama Lengkap
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
                            Text('Mobile Application Workshop')
                          ]),
                        ),
                      ],
                    ),

                    //NIK
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
                            Text('Google Ads')
                          ]),
                        ),
                      ],
                    ),
                    //TEMPATLAHIR
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
                                  TextSpan(
                                      text: 'Tempat  / Kota Dilaksanakan '),
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
                            Text('Depok')
                          ]),
                        ),
                      ],
                    ),
                    //TANGGALLAHIR
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
                            Text('Indonesia Android Kejar')
                          ]),
                        ),
                      ],
                    ),
                    //ALAMAT
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
                                  TextSpan(
                                      text: 'Berijazah / Tidak Berijazah '),
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
                            Text('Berijazah')
                          ]),
                        ),
                      ],
                    ),
                    //AGAMA
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
                            Text('Lulus')
                          ]),
                        ),
                      ],
                    ),
                    // //STATUS
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     RichText(
                    //         textAlign: TextAlign.start,
                    //         text: TextSpan(
                    //             style: quicksandFontStyle.copyWith(
                    //                 color: secondColor,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //             children: <TextSpan>[
                    //               TextSpan(text: 'Status '),
                    //               TextSpan(
                    //                   text: '',
                    //                   style: quicksandFontStyle.copyWith(
                    //                       color: redColor,
                    //                       fontSize: 13,
                    //                       fontWeight: FontWeight.bold))
                    //             ])),
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 10),
                    //       width: size.width * 0.9,
                    //       height: size.height * 0.09,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(25),
                    //         color: greyColor,
                    //       ),
                    //       child: Row(children: <Widget>[
                    //         Container(
                    //           margin: EdgeInsets.only(
                    //             left: size.width * 0.03,
                    //             right: size.width * 0.01,
                    //           ),
                    //           alignment: AlignmentDirectional.center,
                    //           child: InkWell(
                    //             onTap: () {
                    //               // _selectedTodoDate(context);
                    //             },
                    //             child: SvgPicture.asset(
                    //               "assets/icons/password.svg",
                    //               width: size.width * 0.01,
                    //               height: size.height * 0.04,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text('MENIKAH')
                    //       ]),
                    //     ),
                    //   ],
                    // ),
                    // //PEKERJAAN
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     RichText(
                    //         textAlign: TextAlign.start,
                    //         text: TextSpan(
                    //             style: quicksandFontStyle.copyWith(
                    //                 color: secondColor,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //             children: <TextSpan>[
                    //               TextSpan(text: 'Pekerjaan '),
                    //               TextSpan(
                    //                   text: '',
                    //                   style: quicksandFontStyle.copyWith(
                    //                       color: redColor,
                    //                       fontSize: 13,
                    //                       fontWeight: FontWeight.bold))
                    //             ])),
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 10),
                    //       width: size.width * 0.9,
                    //       height: size.height * 0.09,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(25),
                    //         color: greyColor,
                    //       ),
                    //       child: Row(children: <Widget>[
                    //         Container(
                    //           margin: EdgeInsets.only(
                    //             left: size.width * 0.03,
                    //             right: size.width * 0.01,
                    //           ),
                    //           alignment: AlignmentDirectional.center,
                    //           child: InkWell(
                    //             onTap: () {
                    //               // _selectedTodoDate(context);
                    //             },
                    //             child: SvgPicture.asset(
                    //               "assets/icons/password.svg",
                    //               width: size.width * 0.01,
                    //               height: size.height * 0.04,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text('FRONT END')
                    //       ]),
                    //     ),
                    //   ],
                    // ),
                    // //Kewarganegaraaan
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     RichText(
                    //         textAlign: TextAlign.start,
                    //         text: TextSpan(
                    //             style: quicksandFontStyle.copyWith(
                    //                 color: secondColor,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //             children: <TextSpan>[
                    //               TextSpan(text: 'Kewarganegaraan '),
                    //               TextSpan(
                    //                   text: '',
                    //                   style: quicksandFontStyle.copyWith(
                    //                       color: redColor,
                    //                       fontSize: 13,
                    //                       fontWeight: FontWeight.bold))
                    //             ])),
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 10),
                    //       width: size.width * 0.9,
                    //       height: size.height * 0.09,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(25),
                    //         color: greyColor,
                    //       ),
                    //       child: Row(children: <Widget>[
                    //         Container(
                    //           margin: EdgeInsets.only(
                    //             left: size.width * 0.03,
                    //             right: size.width * 0.01,
                    //           ),
                    //           alignment: AlignmentDirectional.center,
                    //           child: InkWell(
                    //             onTap: () {
                    //               // _selectedTodoDate(context);
                    //             },
                    //             child: SvgPicture.asset(
                    //               "assets/icons/password.svg",
                    //               width: size.width * 0.01,
                    //               height: size.height * 0.04,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text('WNI')
                    //       ]),
                    //     ),
                    //   ],
                    // ),
                  ])))),
    );
  }
}
