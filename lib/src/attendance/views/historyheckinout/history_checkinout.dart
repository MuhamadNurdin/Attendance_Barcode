import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/attendance/views/historyheckinout/history_item.dart';

class HistoryChekinoutView extends StatefulWidget {
  const HistoryChekinoutView({Key? key}) : super(key: key);

  @override
  State<HistoryChekinoutView> createState() => _HistoryChekinoutViewState();
}

class _HistoryChekinoutViewState extends State<HistoryChekinoutView> {
  // final _history = HistoryViewModel(historyItems: []);
  final _attendanceController = Get.put(AttendanceController());
  // late List<HistoryCheckinCheckoutResponse> historyItems;

  @override
  void initState() {
    super.initState();
    // historyItems = _history.getreqdinas();
    _attendanceController.getHistoryAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Check",
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
      body: SafeArea(
        child: Obx(
          () {
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _attendanceController.absenOfAttendance.length,
              itemBuilder: (context, index) {
                var history = _attendanceController.absenOfAttendance[index];
                return Card(
                    margin: EdgeInsets.all(20),
                    color: Theme.of(context).cardColor,

                    //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0),
                            top: Radius.circular(10.0)),
                        side: BorderSide(width: 1, color: Colors.black)),
                    child: new HistoryItemView(
                      history.employeeId!.last.toString(),
                      history.checkIn!.toString(),
                      history.checkOut!.toString(),
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}

// class HistoryViewModel {
//   List<HistoryCheckinCheckoutResponse> historyItems;
//   HistoryViewModel({required this.historyItems});
//   getreqdinas() => <HistoryCheckinCheckoutResponse>[
//         HistoryCheckinCheckoutResponse(
//           hcnamekaryawanhistory: 'Muhamad Nurdin History CheckinOut',
//           hccheckinstarthistory: '20-02-2019 08.00 PM',
//           hccheckoutendhistory: '20-02-2019 18.00 PM',
//           hcanotherwidgethistory: '085157515266',
//           hctypehistory: 'Bekerja',
//           hcdetailhistory: 'Terpenuhi',
//         ),
//       ];
// }
