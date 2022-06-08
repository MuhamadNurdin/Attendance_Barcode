import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/Izin/views/izinkeperluan_content/izin_tabbarview.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/attendance/views/history_checkinout.dart';
import 'package:meditation_app/src/attendance/views/historyheckinout/history_checkinout.dart';
import 'package:meditation_app/src/authentication/controllers/signin_controller.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinasluar_tabbarview.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_tabbar_view.dart';
import 'package:meditation_app/widgets/category_card.dart';
import 'package:meditation_app/src/home/views/header.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _attendanceContr = Get.put(AttendanceController());
  // var currentEmployee = getEmployeeId();
  // final _homeController = Get.put(HomeController());
  // final _attendanceContr = Get.put(AttendanceController());

  @override
  void initState() {
    // _attendanceContr.getEmloyee();
    super.initState();
    // _homeController.
    // print(test);
    // await getEmployeeId(currentUser.value.uid);
    // print(_homeController.employeeData);
  }
  // getname3() async {
  //   currentUser2 = await PrefUtils.getUser();
  //   var uid = currentUser.value.uid;
  // }

  // getName2() async {
  //   var user = await PrefUtils.getUser();
  //   var name3 = user.partnerDisplayName.toString();
  //   print(name3);
  //   return name3;
  // }
  // _loadCounter() async {
  //   final test = await PrefUtils.getUser();
  //   // var test = await PrefUtils.getUser();
  //   final String test2 = test.name.toString();
  //   print('ini adalah $test2');
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        backgroundColor: Colors.teal,
        color: Colors.white,
        displacement: 200,
        strokeWidth: 5,
        child: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .35,
              decoration: BoxDecoration(
                color: Color(0xFFF45C2E3).withOpacity(.75),

                // image: DecorationImage(
                //   alignment: Alignment.centerLeft,
                //   image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                // ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: 52,
                    //     width: 52,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xFFF2BEA1),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: SvgPicture.asset("assets/icons/menu.svg"),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Header(
                      name: currentUser.value.partnerDisplayName,
                    ),
                    SizedBox(height: 50),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .99,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          // Obx(() => Text(
                          //     'Obx: ${_homeController.employeeId.toString()}')),
                          // _homeController.employeeData[0].attendanceState ==
                          //         'checked_in'
                          //     ? Text("data Check")
                          //     : Text("data"),

                          CustomCard(
                            title: "Attendance",
                            svgPath:
                                "assets/icons/asset-beranda-keuntungan.svg",
                            onPressed: () {
                              Get.to(HistoryChekinoutView());
                            },
                          ),
                          CustomCard(
                            title: "Cuti",
                            svgPath: "assets/icons/asset-beranda-panduan.svg",
                            onPressed: () {
                              Get.to(CutiListView1(
                                title: 'Cuti Screen',
                              ));
                            },
                          ),
                          CustomCard(
                            title: "Dinas Luar",
                            // title: _homeController.getEmloyee(),
                            svgPath: "assets/icons/asset-beranda-cetak.svg",
                            onPressed: () {
                              // _attendanceContr.getNama();
                              Get.to(DinasLuarTabbarView());
                            },
                          ),
                          CustomCard(
                            title: "Izin Keperluan",
                            svgPath: "assets/icons/asset-beranda-laporan.svg",
                            onPressed: () {
                              Get.to(IzinTabbarView());
                            },
                          ),
                          CustomCard(
                            title: "Kompensasi",
                            svgPath: "assets/icons/asset-beranda-akseptasi.svg",
                            onPressed: () {},
                          ),
                          CustomCard(
                            title: "Evaluasi",
                            svgPath: "assets/icons/asset-beranda-download.svg",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    Obx(() => Text(_attendanceContr.empData.value.attendanceState.toString()));

    setState(() {});
  }
}
