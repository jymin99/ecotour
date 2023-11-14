import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capstone/fire_model.dart';

class FireService {
  static final FireService _fireService = FireService._internal();

  factory FireService() => _fireService;

  FireService._internal();

  // Create
  Future createNewMotto(Map<String, dynamic> json) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("cafe_db").doc();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  // READ 각각의 데이터를 콕 집어서 가져올때
  Future<FireModel> getFireModel(String userkey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("cafe_db").doc(userkey);
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();
    FireModel fireModel = FireModel.fromSnapShot(documentSnapshot);
    return fireModel;
  }

  //READ 컬렉션 내 모든 데이터를 가져올때
  Future<List<FireModel>> getFireModels() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("cafe_db");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("date").get();

    List<FireModel> cafe = [];
    for (var doc in querySnapshot.docs) {
      FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      cafe.add(fireModel);
    }
    return cafe;
  }
//Delete
  Future<void> delFireModel(DocumentReference reference) async {
    await reference.delete();
  }

//Update
  Future<void> updateFireModel(Map<String, dynamic> json,DocumentReference reference) async {
    await reference.set(json);
  }
}

// CollectionReference<Map<String, dynamic>> collectionReference =
// FirebaseFirestore.instance.collection("cafe_db");
//
// QuerySnapshot<Map<String, dynamic>> querySnapshot =
//     await collectionReference.get();
//
// //READ 컬렉션 내 모든 데이터를 가져올때
// Future<List<FireModel>> getFireModels() async {
//   CollectionReference<Map<String, dynamic>> collectionReference =
//   FirebaseFirestore.instance.collection("cafe_db");
//   QuerySnapshot<Map<String, dynamic>> querySnapshot =
//   await collectionReference.get();
//
//   List<FireModel> cafe = [];
//   for (var doc in querySnapshot.docs) {
//     FireModel fireModel = FireModel.fromQuerySnapshot(doc);
//     cafe.add(fireModel);
//   }
//   return cafe;
// }
