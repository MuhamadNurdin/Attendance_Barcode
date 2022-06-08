import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/modules/attandance_api_module.dart';
import 'package:meditation_app/common/api_factory/modules/employee_api_module.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/attendance/models/attendance_model.dart';

class AttendanceController extends GetxController {
  var absenOfAttendance = <Records>[].obs;
  var empData = RecordsEmployee().obs;
  var qrcode = ''.obs;
  RxInt log2 = 0.obs;
  var nama = ''.obs;
  RxBool absenIn = false.obs;

  void change() => log2.value++;

  @override
  void onInit() async {
    getEmloyee();
    await qrCodeApi();
    super.onInit();
  }

  getEmloyee() {
    employeeApi(
      onResponse: (response) {
        empData.value = response;
        // if (empData.value.attendanceState == 'checkIn') {
        //   absenIn;
        // }
      },
    );
  }

  void getNama() {
    nama.value = "Jaya";
  }

  getHistoryAttendance() {
    attandanceApi(
      onResponse: (response) {
        absenOfAttendance.assignAll(response.records!);
      },
    );
  }

  void putAbsentIn(
      int? employeeId, String location, String barcode, String image) async {
    // empData.update((_) {
    //   empData.value.attendanceState = "checked_in";
    // });
    await absenSignIn(employeeId, location, barcode, image);
    // await absenAttendanceApi(empData.value.id);
    empData.update((_) {
      empData.value.attendanceState = "checked_in";
    });
    // update();
    print("========CheckIn========");
    print(empData.value.attendanceState);
  }

  void putAbsentOut(int? employeeId) async {
    // empData.update((_) {
    //   empData.value.attendanceState = "checked_out";
    // });
    // if (empData.value.attendanceState == 'checked_in') {
    //   empData.update((_) {
    //     empData.value.attendanceState = "checked_out";
    //   });
    // } else {
    //   empData.update((_) {
    //     empData.value.attendanceState = "checked_in";
    //   });
    // }
    absenAttendanceApi(empData.value.id);
    // update();
    // empData.value.attendanceState = "checked_out";
    empData.update((_) {
      empData.value.attendanceState = "checked_out";
    });
    print("========Check========");
    print(empData.value.attendanceState);
  }

  Future qrCodeApi() async {
    var dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
    Api.searchRead(
        model: 'hr.qrcode',
        domain: [
          ['date', '=', dateNow]
        ],
        fields: ['date', 'qrcode'],
        onResponse: (response) {
          var response1 = (response as Map<String, dynamic>)['records'];
          qrcode.value = (response1 as List<dynamic>)[0]['qrcode'];
        },
        onError: (error, data) {
          handleApiError(error);
        });
  }
}
