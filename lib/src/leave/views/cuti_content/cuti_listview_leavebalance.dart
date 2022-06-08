import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';

class LeaveBalanceListView extends StatefulWidget {
  const LeaveBalanceListView({Key? key}) : super(key: key);

  @override
  State<LeaveBalanceListView> createState() => _LeaveBalanceListViewState();
}

class _LeaveBalanceListViewState extends State<LeaveBalanceListView> {
  final _leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
    _leaveController.searchLeave();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _leaveController.responseAllocate.length,
              itemBuilder: (context, index) {
                var lbalance = _leaveController.responseAllocate[index];
                return new Card(
                  margin: EdgeInsets.all(20),
                  color: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10.0),
                          top: Radius.circular(10.0)),
                      side: BorderSide(width: 1, color: Colors.black)),
                  child: new ItemViewLeaveBalance(
                    lbalance.typeId!.last.toString(),
                    lbalance.days.toString(),
                    lbalance.days.toString(),
                    lbalance.days.toString(),
                    lbalance.days.toString(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
