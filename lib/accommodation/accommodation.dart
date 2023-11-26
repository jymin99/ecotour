class Accommodation {
  String add1;
  String add2;
  String contentid;
  String contenttypeid;
  String mapx;
  String mapy;
  String title;
  String tel;

  Accommodation({
    required this.add1,
    required this.add2,
    required this.contentid,
    required this.contenttypeid,
    required this.mapx,
    required this.mapy,
    required this.title,
    required this.tel,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      add1: json['addr1'] ?? '',
      add2: json['addr2'] ?? '',
      contentid: json['contentid'] ?? '',
      contenttypeid: json['contenttypeid'] ?? '',
      mapx: json['mapx'] ?? '0.0',
      mapy: json['mapy'] ?? '0.0',
      title: json['title'] ?? '',
      tel: json['tel'] ?? '',
    );
  }
}