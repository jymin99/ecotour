class Cycle {
  String staLoc;
  String rentId;
  String rentNo;
  String rentNm;
  String rentIdNm;
  String holdNum;
  String staAdd1;
  String staAdd2;
  String staLat;
  String staLong;
  int startIndex;
  int endIndex;
  String rnum;

  @override
  String toString() {
    return 'Cycle{rentId: $rentId, rentNm: $rentNm, staLoc: $staLoc}';
  }

  Cycle({
    required this.staLoc,
    required this.rentId,
    required this.rentNo,
    required this.rentNm,
    required this.rentIdNm,
    required this.holdNum,
    required this.staAdd1,
    required this.staAdd2,
    required this.staLat,
    required this.staLong,
    required this.startIndex,
    required this.endIndex,
    required this.rnum,
  });


  factory Cycle.fromJson(Map<String, dynamic> json) {
    return Cycle(
      staLoc: json['STA_LOC'] ?? '',
      rentId: json['RENT_ID'] ?? '',
      rentNo: json['RENT_NO'] ?? '',
      rentNm: json['RENT_NM'] ?? '',
      rentIdNm: json['RENT_ID_NM'] ?? '',
      holdNum: json['HOLD_NUM'] ?? '',
      staAdd1: json['STA_ADD1'] ?? '',
      staAdd2: json['STA_ADD2'] ?? '',
      staLat: json['STA_LAT'] ?? '0.0',
      staLong: json['STA_LONG'] ?? '0.0',
      startIndex: json['START_INDEX'] ?? 0,
      endIndex: json['END_INDEX'] ?? 0,
      rnum: json['RNUM'] ?? '',
    );
  }
}