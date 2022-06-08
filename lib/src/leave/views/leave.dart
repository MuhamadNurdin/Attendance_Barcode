import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/common/widgets/main_container.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/create_leave.dart';
import 'package:meditation_app/src/leave/views/leave.new.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final _leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
    _leaveController.getListLeave("leave");
    _leaveController.searchLeave();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isAppBar: true,
      appBarTitle: "Leave",
      padding: 20.0,
      actions: [
        // IconButton(
        //   onPressed: () {
        //     // showLogoutDialog();
        //     // print(_leaveController.responseType);
        //   },
        //   icon: Icon(Icons.exit_to_app),
        // )
      ],
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: _leaveController.listOfPartners.length,
            itemBuilder: (context, i) {
              return ListTile(
                // leading: ClipRRect(
                //   borderRadius: BorderRadius.circular(8.0),
                //   child: _partnerController
                //           .listOfPartners[index].image512!.isNotEmpty
                //       ? Image.memory(
                //           base64.decode(_partnerController
                //               .listOfPartners[index].image512!),
                //           height: 40,
                //           width: 40,
                //         )
                //       : Icon(
                //           Icons.person,
                //           color: AppColors.grey,
                //           size: 40,
                //         ),
                // ),
                title: Text(_leaveController.listOfPartners[i].name!),
                subtitle: Text(_leaveController.listOfPartners[i].dateFrom!),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateLeave());
          // Get.to(LeaveNew());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
