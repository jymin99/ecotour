import 'package:cloud_firestore/cloud_firestore.dart';

class FireService {
  // 싱글톤 패턴
  static final FireService _fireService = FireService._internal();
  factory FireService() => _fireService;
  FireService._internal();

  //Create
  Future createCafeList(Map<String, dynamic> json) async {
    // 초기화
    await FirebaseFirestore.instance.collection("cafe_list").add(json);
  }
}
