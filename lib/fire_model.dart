import 'package:cloud_firestore/cloud_firestore.dart';

/// shop : "빈티지 204"
/// category : "개인컵 할인"
/// address : "은평구 은평로 193-1( 은평구 녹번동 204)"
/// reference : "reference"

class FireModel {

  FireModel({
    this.shop,
    this.category,
    this.address,
    this.reference,
  });

  String? shop;
  String? category;
  String? address;
  DocumentReference? reference;

  FireModel.fromJson(dynamic json,this.reference) {
    shop = json['shop'];
    category = json['category'];
    address = json['address'];
  }


  FireModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(),snapshot.reference);

  FireModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(),snapshot.reference);

// 파이어 베이스로 저장 할때 쓴다.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop'] = shop;
    map['category'] = category;
    map['address'] = address;
    return map;
  }
}
