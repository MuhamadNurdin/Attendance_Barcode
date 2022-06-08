import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/attendance/views/attendace.dart';
import 'package:meditation_app/src/attendance/views/history_checkinout.dart';
import 'package:meditation_app/widgets/category_card.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                title: "Attendance History",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryChekinout()),
                  );
                },
              ),
              CustomCard(
                title: "Leave",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {
                  Get.to(Attendance('test'));
                },
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                title: "KOMPENSASI",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {},
              ),
              CustomCard(
                title: "Evaluasi",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                title: "Dinas Luar",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {},
              ),
              CustomCard(
                title: "Izin Keperluan",
                svgPath: "assets/icons/asset-beranda-keuntungan.svg",
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
