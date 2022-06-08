class PostPoneResponse {
  final String description;
  final double refNo;

  final String assignTime;
  final String postponeTime;
  final String postponedReason;
  final String contactNo;
  final String namaKaryawan;
  // final String detailCuti;
  final String tipeCuti;
  final String mulaiCutiKaryawan;
  final String sampaiCutiKaryawan;
  final double codAmount;

  PostPoneResponse(
      {required this.description,
      required this.refNo,

      // required this.detailCuti,
      required this.assignTime,
      required this.postponeTime,
      required this.postponedReason,
      required this.contactNo,
      required this.namaKaryawan,
      required this.tipeCuti,
      required this.mulaiCutiKaryawan,
      required this.sampaiCutiKaryawan,
      required this.codAmount});

  factory PostPoneResponse.fromJson(Map<String, dynamic> json) {
    return new PostPoneResponse(
      description: json['DESCR'],
      refNo: json['REFNO'],
      assignTime: json['ASSIGNTIME'],
      postponeTime: json['POSTPONTIME'],
      postponedReason: json['POSTPONDRSN'],
      contactNo: json['CONTACTNO'],
      namaKaryawan: json['ENDCUST'],
      tipeCuti: json['FULLADDRESS'],
      mulaiCutiKaryawan: json['BRAND'],
      sampaiCutiKaryawan: json['MODEL'],
      codAmount: json['CODAMT'],
    );
  }
}
//---------------------------------------------------

class RequestLeaveResponse {
  final String rlnameRequestLeave;
  final String rlmulaiCutiRequestLeave;

  final String rlsampaiCutiRequestLeave;
  final String rlcontactCutiRequestLeave;
  final String rltipeCutiRequestLeave;
  final String rlreasonRequestLeave;

  RequestLeaveResponse({
    required this.rlnameRequestLeave,
    required this.rlmulaiCutiRequestLeave,

    // required this.detailCuti,
    required this.rlsampaiCutiRequestLeave,
    required this.rlcontactCutiRequestLeave,
    required this.rltipeCutiRequestLeave,
    required this.rlreasonRequestLeave,
  });

  factory RequestLeaveResponse.fromJson(Map<String, dynamic> json) {
    return new RequestLeaveResponse(
      rlnameRequestLeave: json['RLNAME'],
      rlmulaiCutiRequestLeave: json['RLMULAICUTI'],
      rlsampaiCutiRequestLeave: json['RLSAMPAICUTI'],
      rlcontactCutiRequestLeave: json['RLCONTACT'],
      rltipeCutiRequestLeave: json['RLTIPE'],
      rlreasonRequestLeave: json['RLREASON'],
    );
  }
}
