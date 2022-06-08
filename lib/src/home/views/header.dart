// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:meditation_app/constantmaterial/constants.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/attendance/views/attendace.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';
import 'package:meditation_app/src/profile/datakaryawan/profile_main.dart';

class Header extends StatelessWidget {
  Header({Key? key, this.name}) : super(key: key);

  final String? name;
  final _attendanceContr = Get.put(AttendanceController());

  // void getCode() async {
  //   await _attendanceContr.qrCodeApi();
  // }

  Future scanbarcode() async {
    await _attendanceContr.qrCodeApi();
    var qr = _attendanceContr.qrcode.value;
    // var qr1 = Obx(() => Text(_attendanceContr.qrcode.value));
    print("==========================$qr");
    FlutterBarcodeScanner.scanBarcode(
            "#009922", "CANCEL", true, ScanMode.BARCODE)
        .then((String kode) {
      // Obx(() => kode == qr ? Get.to(Attendance(kode)) : Get.off(HomeScreen()));
      // Obx(()=>_attendanceContr.qrcode.value == kode?Text("new"):("old"))
      // Obx(() => _attendanceContr.qrcode.value);
      print("==========================$kode=============================");
      (kode == qr) ? Get.to(Attendance(kode)) : Get.off(HomeScreen());
    });
  }

  // final signInView = IconButton(
  //   onPressed: () async {
  //     // Get.to(Attendance());\
  //   },
  //   icon: const Icon(Icons.qr_code_scanner_outlined, size: 40.0),
  //   //icon data for elevated button
  // );

  // final signIOutView = IconButton(
  //   onPressed: () {
  //     // _attendanceContr.putAbsentOut();
  //     Get.to(Attendance('test'));
  //   },
  //   icon: const Icon(Icons.exit_to_app_sharp, size: 40.0),
  //   //icon data for elevated button
  // );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding / 35),
      // It will cover 20% of our total height
      height: size.height * 0.08,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              // bottom: kDefaultPadding,
            ),
            // height: size.height * 0.1 - 7,
            decoration: BoxDecoration(
              color: Color(0xFFF45C2E3).withOpacity(.55),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 15, // blur radius
                  offset: Offset(0.0, 0.95), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  width: 130,
                  height: 100,
                  child: Center(
                    child: Text(
                      '$name',
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Obx(
                //   () => Text(
                //     'Hi ${_attendanceContr.empData.value.attendanceState}',
                //     // 'Hi ${_attendanceContr.nama}',
                //     style: Theme.of(context).textTheme.headline6!.copyWith(
                //         color: Colors.white, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Spacer(),
                // IconButton(
                //   onPressed: () {
                //     // ashowAlertDialog(context);
                //     showLogoutDialog();
                //   },
                //   icon: const Icon(Icons.exit_to_app_sharp,
                //       size: 40.0), //icon  data for elevated button
                // ),
                SizedBox(width: 10),
                // IconButton(
                //     onPressed: () {
                //       _attendanceContr.getEmloyee();
                //     },
                //     icon: const Icon(
                //       Icons.refresh,
                //       size: 40.0,
                //     )),
                // // SizedBox(width: 10),
                // // Obx(() => Text(
                // //     _attendanceContr.empData.value.attendanceState.toString())),
                SizedBox(width: 10),
                Obx(
                  () => _attendanceContr.empData.value.attendanceState ==
                          "checked_out"
                      ? IconButton(
                          onPressed: () async {
                            // Get.to(Attendance());\
                            scanbarcode();
                            // _attendanceContr.putAbsentOut(
                            //     _attendanceContr.empData.value.id);
                          },
                          icon: const Icon(Icons.qr_code_scanner_outlined,
                              size: 40.0),
                          //icon data for elevated button
                        )
                      : IconButton(
                          onPressed: () {
                            _attendanceContr.putAbsentOut(
                                _attendanceContr.empData.value.id);
                            // Get.to(Attendance('test'));
                            // Get.defaultDialog(
                            //     onConfirm: _attendanceContr.change(
                            //         _attendanceContr.empData.value.id));
                          },
                          icon: const Icon(Icons.exit_to_app_sharp, size: 40.0),
                          //icon data for elevated button
                        ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.to(ProfileDataKaryawan());
                  },
                  icon: const Icon(Icons.account_circle_rounded,
                      size: 40.0), //icon data for elevated button
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ashowAlertDialog(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      title: Text("Logout Application ?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('OK')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('NO')),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      title: Text("Attendance Finished"),
      actions: [
        ElevatedButton(
            onPressed: () {
              // _attendanceContr.putAbsentOut();
            },
            child: Text('OK')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('NO')),
      ],
    );
  }
}
