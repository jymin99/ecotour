class Ev {
  int csId;
  String csNm; // 충전소 명칭
  String addr; // 충전소 주소
  String lat; // 위도
  String longi; // 경도
  int cpId;
  String cpNm; // 충전기 명칭
  String chargeTp; // 충전기 타입
  String cpTp; // 충전 방식
  String statUpdatetime;
  String cpStat; // 충전기 상태 코드


  Ev({
    required this.csId,
    required this.csNm,
    required this.addr,
    required this.lat,
    required this.longi,
    required this.cpId,
    required this.cpNm,
    required this.chargeTp,
    required this.cpTp,
    required this.statUpdatetime,
    required this.cpStat,

  });

  factory Ev.fromJson(Map<String, dynamic> json) {
    // 충전기 타입
    if (json["chargeTp"] == "1") {
      json["chargeTp"] = "충전기 타입 : 완속";
    } else if (json["chargeTp"] == "2") {
      json["chargeTp"] = "충전기 타입 : 급속";
    }

    // 충전기 상태 코드
    if (json["cpStat"] == "1") {
      json["cpStat"] = "충전기 상태 : 충전 가능";
    } else if (json["cpStat"] == "2") {
      json["cpStat"] = "충전기 상태 : 충전중";
    } else if (json["cpStat"] == "3") {
      json["cpStat"] = "충전기 상태 : 고장/정검";
    } else if (json["cpStat"] == "4") {
      json["cpStat"] = "충전기 상태 : 통신장애";
    } else if (json["cpStat"] == "5") {
      json["cpStat"] = "충전기 상태 : 통신미연결";
    }

    // 충전 방식
    if (json["cpTp"] == "1") {
      json["cpTp"] = "충전 방식 : B타입(5핀)";
    } else if (json["cpTp"] == "2") {
      json["cpTp"] = "충전 방식 : C타입(5핀)";
    } else if (json["cpTp"] == "3") {
      json["cpTp"] = "충전 방식 : BC타입(5핀)";
    } else if (json["cpTp"] == "4") {
      json["cpTp"] = "충전 방식 : BC타입(5핀)";
    } else if (json["cpTp"] == "5") {
      json["cpTp"] = "충전 방식 : DC차데모";
    } else if (json["cpTp"] == "6") {
      json["cpTp"] = "충전 방식 : AC3상";
    } else if (json["cpTp"] == "7") {
      json["cpTp"] = "충전 방식 : DC콤보";
    } else if (json["cpTp"] == "8") {
      json["cpTp"] = "충전 방식 : DC차데모+DC콤보";
    } else if (json["cpTp"] == "9") {
      json["cpTp"] = "충전 방식 : DC차데모+AC3상";
    } else if (json["cpTp"] == "10") {
      json["cpTp"] = "충전 방식 : DC차데모+DC콤보+AC3상";
    }



    return Ev(
      csId: json["csId"] ?? 0,
      csNm: json["csNm"] as String ?? "",
      addr: json["addr"] != null ? json["addr"] as String : "",
      lat: json["lat"] as String ?? "0.0",
      longi: json["longi"] as String ?? "0.0",
      cpId: json["cpId"] ?? 0,
      cpNm: json["cpNm"] as String ?? "",
      chargeTp: json["chargeTp"] as String ?? "",
      cpTp: json["cpTp"] as String ?? "",
      statUpdatetime: json["statUpdatetime"] as String ?? "",
      cpStat: json["cpStat"] as String ?? "",

    );
  }
}
