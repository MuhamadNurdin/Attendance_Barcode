import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/common/widgets/main_container.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/create_leave.dart';

class LeaveNew extends StatefulWidget {
  @override
  _LeaveNewState createState() => _LeaveNewState();
}

class _LeaveNewState extends State<LeaveNew> {
  final _leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
    _leaveController.searchLeave();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isAppBar: true,
      appBarTitle: "Leave Type",
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
            itemCount: _leaveController.responseType.length,
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
                title: Text(_leaveController.responseType[i].name!),
                subtitle: Text(_leaveController.responseType[i].id.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateLeave());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
