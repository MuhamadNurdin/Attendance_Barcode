import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/dio_factory.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/attendance/models/attendance_model.dart';

attandanceApi({required OnResponse<AttendanceModel> onResponse}) {
  Api.searchRead(
    model: "hr.attendance",
    domain: [],
    fields: ["employee_id", "check_in", "check_out"],
    onResponse: (response) {
      onResponse(AttendanceModel.fromJson(response));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

absenAttendanceApi(int? employeeId) {
  Api.callKW(
      model: "hr.employee",
      method: "attendance_manual",
      args: [employeeId, "hr_attendance.hr_attendance_action_my_attendances"],
      onResponse: (response) {},
      onError: (error, data) {
        handleApiError(error);
      });
}

Future absenSignIn(
    int? employeeId, String location, String barcode, String? image) async {
  Api.callKW(
      model: "hr.employee",
      method: "attendance_manual",
      args: [employeeId, "hr_attendance.hr_attendance_action_my_attendances"],
      onResponse: (response) {
        var attendance =
            (response as Map<String, dynamic>)['action']['attendance'];
        print(attendance['id']);
        // var attendId = response['id'];
        signInAbsent(attendance['id'], barcode, location, image);
      },
      onError: (error, data) {
        handleApiError(error);
      });
}

signInAbsent(int attendId, String? barcode, String? location, String? image) {
  Api.write(
      model: 'hr.attendance',
      ids: [attendId],
      values: {"barcode": barcode, "location": location, 'image_before': image},
      onResponse: (response) {},
      onError: (error, data) {
        handleApiError(error);
      });
}
