class LeaveModel {
  List<Records>? records;

  LeaveModel({this.records});

  LeaveModel.fromJson(dynamic json) {
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
  List<dynamic>? leaveType;
  String? name;
  String? dateFrom;
  String? dateTo;
  String? state;
  String? status;
  List<dynamic>? user;

  Records(
      {this.id,
      this.leaveType,
      this.name,
      this.dateFrom,
      this.dateTo,
      this.state,
      this.status,
      this.user});

  Records.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"] is! bool ? json["name"] : "";
    leaveType = json["holiday_status_id"];
    dateFrom =
        json["request_date_from"] is! bool ? json["request_date_from"] : "";
    dateTo = json["request_date_to"] is! bool ? json["request_date_to"] : "";
    state = json["state"];
    user = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["holiday_status_id"] = leaveType;
    map["request_date_from"] = dateFrom;
    map["request_date_to"] = dateTo;
    map["state"] = state;
    map["user_id"] = user;
    return map;
  }
}

class ListType {
  List<RecordsListType>? records;

  ListType({this.records});

  ListType.fromJson(dynamic json) {
    if (json["records"] != null) {
      records = [];
      json["records"].forEach((v) {
        records?.add(RecordsListType.fromJson(v));
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

class RecordsListType {
  int? id;
  String? name;

  RecordsListType({this.id, this.name});

  RecordsListType.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"] is! bool ? json["name"] : "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}

class ListAllocation {
  List<RecordsListAllocation>? records;

  ListAllocation({this.records});

  ListAllocation.fromJson(dynamic json) {
    if (json["records"] != null) {
      records = [];
      json["records"].forEach((v) {
        records?.add(RecordsListAllocation.fromJson(v));
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

class RecordsListAllocation {
  int? id;
  List<dynamic>? typeId;
  double? days;
  List<dynamic>? approveId;

  RecordsListAllocation({this.id, this.typeId, this.days, this.approveId});

  RecordsListAllocation.fromJson(dynamic json) {
    id = json["id"];
    typeId =
        json["holiday_status_id"] is! bool ? json["holiday_status_id"] : "";
    days = json["number_of_days"] is! bool ? json["number_of_days"] : "";
    approveId =
        json["first_approver_id"] is! bool ? json["first_approver_id"] : "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["holiday_status_id"] = typeId;
    map["number_of_days"] = days;
    map["first_approver_id"] = approveId;
    return map;
  }
}

class TypeAllocation {
  int? id;
  String? name;

  TypeAllocation({this.id, this.name});
}
