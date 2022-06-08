//---------------------------------------------------

class RequestIzinResponseIzin {
  final String rinameRequestIzinLeave;
  final String rimulaiIzinRequestLeave;

  final String risampaiIzinRequestLeave;
  final String ricontactIzinRequestLeave;
  final String ritipeIzinRequestLeave;
  final String rireasonIzinRequestLeave;

  RequestIzinResponseIzin({
    required this.rinameRequestIzinLeave,
    required this.rimulaiIzinRequestLeave,
    required this.risampaiIzinRequestLeave,
    required this.ricontactIzinRequestLeave,
    required this.ritipeIzinRequestLeave,
    required this.rireasonIzinRequestLeave,
  });

  factory RequestIzinResponseIzin.fromJson(Map<String, dynamic> json) {
    return new RequestIzinResponseIzin(
      rinameRequestIzinLeave: json['RLNAMEIZIN'],
      rimulaiIzinRequestLeave: json['RLMULAIIZIN'],
      risampaiIzinRequestLeave: json['RLSAMPAIIZIN'],
      ricontactIzinRequestLeave: json['RLCONTACTIZIN'],
      ritipeIzinRequestLeave: json['RLTIPEIZIN'],
      rireasonIzinRequestLeave: json['RLREASONIZIN'],
    );
  }
}

//---------------------------------

class RequestIzinBossViewResponse {
  final String bvnameRequestIzin;
  final String bvmulaiIzin;
  final String bvsampaiIzin;
  final String bvcontactIzin;
  final String bvtipeIzin;
  final String bvreasonIzin;

  RequestIzinBossViewResponse({
    required this.bvnameRequestIzin,
    required this.bvmulaiIzin,
    required this.bvsampaiIzin,
    required this.bvcontactIzin,
    required this.bvtipeIzin,
    required this.bvreasonIzin,
  });

  factory RequestIzinBossViewResponse.fromJson(Map<String, dynamic> json) {
    return new RequestIzinBossViewResponse(
        bvnameRequestIzin: json['BVNAMEIZIN'],
        bvmulaiIzin: json['BVSTARTIZIN'],
        bvsampaiIzin: json['BVENDIZIN'],
        bvcontactIzin: json['BVCONTACTIZIN'],
        bvtipeIzin: json['BVTIPEIZIN'],
        bvreasonIzin: json['BVREASONIZIN']);
  }
}
