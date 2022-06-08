import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_keluarga.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pendidikan.dart';

class ViewDataPendidikan extends StatelessWidget {
  const ViewDataPendidikan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(DataPendidikan());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "     Data Pendidikan",
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
                                  TextSpan(text: 'SD '),
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
                            Text('SDN Cibuluh 1')
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
                                  TextSpan(text: 'SLTP '),
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
                            Text('SMPN 8 Bogor')
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
                                  TextSpan(text: 'SMU/SMK '),
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
                            Text('SMAN 7 Bogor')
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
                                  TextSpan(text: 'Akademi '),
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
                            Text('Tidak Mengikuti')
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
                                  TextSpan(text: 'Universitas '),
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
                            Text('Universitas Gunadarma')
                          ]),
                        ),
                      ],
                    ),
                    // //AGAMA
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
                    //               TextSpan(text: 'Anak Selanjutnya '),
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
                    //         Text('Belum Memiliki')
                    //       ]),
                    //     ),
                    //   ],
                    // ),
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
