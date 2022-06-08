import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/config/app_colors.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/common/widgets/main_container.dart';
import 'package:meditation_app/src/partner/controller/partner_controller.dart';
// import 'package:odoo_common_code_latest/common/widgets/log.dart';

class Partner extends StatefulWidget {
  @override
  _PartnerState createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  final _partnerController = Get.put(PartnerController());

  @override
  void initState() {
    super.initState();
    _partnerController.getPartners();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(CutiForm());
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add),
      // ),
      isAppBar: true,
      appBarTitle: "Partner",
      padding: 20.0,
      actions: [
        IconButton(
          onPressed: () {
            showLogoutDialog();
          },
          icon: Icon(Icons.exit_to_app),
        )
      ],
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: _partnerController.listOfPartners.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: _partnerController
                          .listOfPartners[index].image512!.isNotEmpty
                      ? Image.memory(
                          base64.decode(_partnerController
                              .listOfPartners[index].image512!),
                          height: 40,
                          width: 40,
                        )
                      : Icon(
                          Icons.person,
                          color: AppColors.grey,
                          size: 40,
                        ),
                ),
                title: Text(_partnerController.listOfPartners[index].name!),
                subtitle: Text(_partnerController.listOfPartners[index].email!),
              );
            },
          );
        },
      ),
    );
  }
}
