import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/dio_factory.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/home/models/home_models.dart';
import 'package:meditation_app/src/leave/models/leave_models.dart';

leaveApi(String typePermission, {required OnResponse<LeaveModel> onResponse}) {
  Api.searchRead(
    model: "hr.leave",
    domain: [
      ["type_permission", "=", typePermission]
    ],
    fields: [],
    onResponse: (response) {
      onResponse(LeaveModel.fromJson(response));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

listAllocationApi(int? employeeId,
    {required OnResponse<ListAllocation> onResponse}) {
  Api.searchRead(
      model: "hr.leave.allocation",
      domain: [
        ["employee_id", "=", employeeId]
      ],
      fields: [
        'id',
        'holiday_status_id',
        'number_of_days',
        'first_approver_id'
      ],
      onResponse: (response) {
        onResponse(ListAllocation.fromJson(response));
      },
      onError: (error, data) {
        handleApiError(error);
      });
}

listTypeApi(List<dynamic> typeId, {required OnResponse<ListType> onResponse}) {
  Api.searchRead(
    model: "hr.leave.type",
    domain: [
      ["id", "in", typeId]
    ],
    fields: [],
    onResponse: (response) {
      onResponse(ListType.fromJson(response));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

listTypeTypeApi(String typePermission,
    {required OnResponse<ListType> onResponse}) {
  Api.searchRead(
    model: "hr.leave.type",
    domain: [
      ["type_permission", "=", typePermission]
    ],
    fields: [],
    onResponse: (response) {
      onResponse(ListType.fromJson(response));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}
