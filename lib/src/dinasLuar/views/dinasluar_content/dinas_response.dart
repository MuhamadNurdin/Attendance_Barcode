//---------------------------------------------------

class RequestLeaveResponseDinas {
  final String rlnameRequestDinasLeave;
  final String rlmulaiDinasRequestLeave;

  final String rlsampaiDinasRequestLeave;
  final String rlcontactDinasRequestLeave;
  final String rltipeDinasRequestLeave;
  final String rlreasonDinasRequestLeave;

  RequestLeaveResponseDinas({
    required this.rlnameRequestDinasLeave,
    required this.rlmulaiDinasRequestLeave,
    required this.rlsampaiDinasRequestLeave,
    required this.rlcontactDinasRequestLeave,
    required this.rltipeDinasRequestLeave,
    required this.rlreasonDinasRequestLeave,
  });

  factory RequestLeaveResponseDinas.fromJson(Map<String, dynamic> json) {
    return new RequestLeaveResponseDinas(
      rlnameRequestDinasLeave: json['RLNAMEDINAS'],
      rlmulaiDinasRequestLeave: json['RLMULAIDINAS'],
      rlsampaiDinasRequestLeave: json['RLSAMPAIDINAS'],
      rlcontactDinasRequestLeave: json['RLCONTACTDINAS'],
      rltipeDinasRequestLeave: json['RLTIPEDINAS'],
      rlreasonDinasRequestLeave: json['RLREASONDINAS'],
    );
  }
}

//---------------------------------

class RequestLeaveBossViewResponse {
  final String bvnameRequestDinasLeave;
  final String bvmulaiDinasRequestLeave;
  final String bvsampaiDinasRequestLeave;
  final String bvcontactDinasRequestLeave;
  final String bvtipeDinasRequestLeave;
  final String bvreasonRequestLeave;

  RequestLeaveBossViewResponse({
    required this.bvnameRequestDinasLeave,
    required this.bvmulaiDinasRequestLeave,
    required this.bvsampaiDinasRequestLeave,
    required this.bvcontactDinasRequestLeave,
    required this.bvtipeDinasRequestLeave,
    required this.bvreasonRequestLeave,
  });

  factory RequestLeaveBossViewResponse.fromJson(Map<String, dynamic> json) {
    return new RequestLeaveBossViewResponse(
        bvnameRequestDinasLeave: json['BVNAME'],
        bvmulaiDinasRequestLeave: json['BVSTART'],
        bvsampaiDinasRequestLeave: json['BVEND'],
        bvcontactDinasRequestLeave: json['BVCONTACT'],
        bvtipeDinasRequestLeave: json['BVTIPE'],
        bvreasonRequestLeave: json['BVREASON']);
  }
}
