class AttendanceModel {
  List<Records>? records;

  AttendanceModel({this.records});

  AttendanceModel.fromJson(dynamic json) {
    if (json["records"] != null) {
      records = [];
      json["records"].forEach((v) {
        records?.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (records != null) {
      map["records"] = records?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Records {
  int? id;
  List<dynamic>? employeeId;
  String? checkIn;
  String? checkOut;

  Records({this.id, this.employeeId, this.checkIn, this.checkOut});

  Records.fromJson(dynamic json) {
    id = json["id"];
    employeeId = json["employee_id"];
    checkIn = json["check_in"] is! bool ? json["check_in"] : "";
    checkOut = json["check_out"] is! bool ? json["check_out"] : "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["employee_id"] = employeeId;
    map["check_in"] = checkIn;
    map["check_out"] = checkOut;
    return map;
  }
}

class HrEmployeeModel {
  List<RecordsEmployee>? records;

  HrEmployeeModel({this.records});

  HrEmployeeModel.fromJson(dynamic json) {
    if (json["records"] != null) {
      records = [];
      json["records"].forEach((v) {
        records?.add(RecordsEmployee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (records != null) {
      map["records"] = records?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RecordsEmployee {
  int? id;
  String? name;
  String? email;
  String? workEmail;
  String? attendanceState;

  RecordsEmployee(
      {this.id, this.name, this.email, this.workEmail, this.attendanceState});

  RecordsEmployee.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"] is! bool ? json["email"] : "";
    workEmail = json["work_email"] is! bool ? json["work_email"] : "";
    attendanceState =
        json["attendance_state"] is! bool ? json["attendance_state"] : "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["work_email"] = workEmail;
    map["attendance_state"] = attendanceState;
    return map;
  }
}
