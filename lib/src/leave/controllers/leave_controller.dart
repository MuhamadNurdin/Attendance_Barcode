import 'dart:convert';

import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/modules/leave_api_module.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/leave/models/leave_models.dart';

class LeaveController extends GetxController {
  var listOfPartners = <Records>[].obs;
  var responseType = <RecordsListType>[].obs;
  var responseAllocate = <RecordsListAllocation>[].obs;

  var empData = Get.find<AttendanceController>().empData;

  List<dynamic> list = [].obs;
  List<RecordsListType> get catagories => responseType.value;

  // var toggle = false.obs;
  // var selectedItem = "test".obs;
  // void changeSelect(String select) {
  //   selectedItem.value = select;
  // }

  getListLeave(String typePermission) {
    leaveApi(
      typePermission,
      onResponse: (response) {
        listOfPartners.assignAll(response.records!);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getListLeave("leave");
  }

  searchLeave() {
    // print("==========================");
    // print(empData.value.id);
    listAllocationApi(
      empData.value.id,
      onResponse: (response) {
        responseAllocate.assignAll(response.records!);
        print(response.records);
        // print(responseAllocate[0].typeId!.first.toString());
        print(responseAllocate.length);
        for (var i = 0; i < responseAllocate.length; i++) {
          print(responseAllocate[i].typeId!.last.toString());
          list.add(responseAllocate[i].typeId!.first);
        }
        print(list);
        listTypeApi(
          list,
          onResponse: (response) {
            responseType.assignAll(response.records!);
            // print(responseType)
          },
        );
      },
    );
    // listTypeApi(
    //   [5, 6],
    //   onResponse: (response) {
    //     responseType.assignAll(response.records!);
    //     // print(responseType)
    //   },
    // );
  }

  onSelectionChange(RecordsListType value) {
    print(value);
    // selectedType.value = value;
    // userTypeId.value = value.id.toString();
  }

  // createLeave(int? holidayId, String desc, String dateFrom, String dateTo,
  //     int? employeeId, double days) {
  //   createLeaveApi(
  //     holidayId,
  //     desc,
  //     dateFrom,
  //     dateTo,
  //     employeeId,
  //     days,
  //   );
  // }

  createLeaveApi(
    String typePermission,
    int? holidayId,
    String desc,
    String dateFrom,
    String dateTo,
    int? employeeId,
    double days,
  ) {
    Api.create(
      model: "hr.leave",
      values: {
        "holiday_status_id": holidayId,
        "name": desc,
        "request_date_from": dateFrom,
        "request_date_to": dateTo,
        "employee_id": employeeId,
        "number_of_days": days,
        "date_from": dateFrom,
        "date_to": dateTo
      },
      onResponse: (response) {
        getListLeave(typePermission);
      },
      onError: (error, data) {
        handleApiError(error);
      },
    );
  }
}
