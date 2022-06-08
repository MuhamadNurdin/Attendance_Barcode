import 'dart:convert';

import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/modules/leave_api_module.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/leave/models/leave_models.dart';

class IzinController extends GetxController {
  var listOfPartners = <Records>[].obs;
  var responseType = <RecordsListType>[].obs;
  var responseAllocate = <RecordsListAllocation>[].obs;

  var empData = Get.find<AttendanceController>().empData;

  List<RecordsListType> get catagories => responseType.value;

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
    getListLeave("permission");
  }

  searchPermission(String typePermission) {
    listTypeTypeApi(
      typePermission,
      onResponse: (response) {
        responseType.assignAll(response.records!);
        // print(responseType)
      },
    );
  }

  onSelectionChange(RecordsListType value) {
    print(value);
  }

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
