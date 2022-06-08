import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/dio_factory.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/attendance/models/attendance_model.dart';
import 'package:meditation_app/src/authentication/controllers/signin_controller.dart';

employeeApi({required OnResponse<RecordsEmployee> onResponse}) {
  Api.searchRead(
    model: "hr.employee",
    domain: [
      ["user_id", "=", currentUser.value.uid]
    ],
    fields: ["id", "name", "last_check_in", "work_email", "attendance_state"],
    onResponse: (response) {
      var userData = (response as Map<String, dynamic>)['records'];
      var listUser = (userData as List<dynamic>)[0];
      onResponse(RecordsEmployee.fromJson(listUser));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}
