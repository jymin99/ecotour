import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capstone/models/fire_model.dart';

class FireService {
  static final FireService _fireService = FireService._internal();

  factory FireService() => _fireService;

  FireService._internal();

  // Create cafe
  Future createNewMotto(Map<String, dynamic> json) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("cafe").doc();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  // Create eco_shop
  Future createEcoShop(Map<String, dynamic> json) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("eco_shop").doc();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  // Create store
  Future createStore(Map<String, dynamic> json) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("store").doc();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  // Create refill
  Future createRefill(Map<String, dynamic> json) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection("refill").doc();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  // // READ 각각의 데이터를 콕 집어서 가져올때
  // Future<FireModel> getFireModel(String userkey) async {
  //   DocumentReference<Map<String, dynamic>> documentReference =
  //   FirebaseFirestore.instance.collection("cafe").doc(userkey);
  //   final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //   await documentReference.get();
  //   FireModel fireModel = FireModel.fromSnapShot(documentSnapshot);
  //   return fireModel;
  // }


  //READ 컬렉션 내 모든 데이터를 가져올때
  // Future<List<FireModel>> getFireModels() async {
  //   CollectionReference<Map<String, dynamic>> collectionReference =
  //   FirebaseFirestore.instance.collection("cafe");
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //   await collectionReference.orderBy("date").get();
  //
  //   List<FireModel> cafe = [];
  //   for (var doc in querySnapshot.docs) {
  //     FireModel fireModel = FireModel.fromQuerySnapshot(doc);
  //     cafe.add(fireModel);
  //   }
  //   return cafe;
  // }

  Future<List<Map<String, dynamic>>> getFireModels() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("cafe");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("shop").get();

    List<Map<String, dynamic>> cafe = [];
    for (var doc in querySnapshot.docs) {
      // FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      // cafe.add(fireModel);
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      cafe.add(data);
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


  // ecoShop
  Future<List<Map<String, dynamic>>> getEcoShop() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("eco_shop");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("name").get();

    List<Map<String, dynamic>> eco_shop = [];
    for (var doc in querySnapshot.docs) {
      // FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      // cafe.add(fireModel);
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      eco_shop.add(data);
    }
    return eco_shop;
  }

//Delete
  Future<void> delEcoShop(DocumentReference reference) async {
    await reference.delete();
  }

//Update
  Future<void> updateEcoShop(Map<String, dynamic> json,DocumentReference reference) async {
    await reference.set(json);
  }

  // refill
  Future<List<Map<String, dynamic>>> getRefill() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("refill");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("name").get();

    List<Map<String, dynamic>> refill = [];
    for (var doc in querySnapshot.docs) {
      // FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      // cafe.add(fireModel);
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      refill.add(data);
    }
    return refill;
  }

//Delete
  Future<void> delRefill(DocumentReference reference) async {
    await reference.delete();
  }

//Update
  Future<void> updateRefill(Map<String, dynamic> json,DocumentReference reference) async {
    await reference.set(json);
  }

  // store
  Future<List<Map<String, dynamic>>> getStore() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("store");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("name").get();

    List<Map<String, dynamic>> store = [];
    for (var doc in querySnapshot.docs) {
      // FireModel fireModel = FireModel.fromQuerySnapshot(doc);
      // cafe.add(fireModel);
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      store.add(data);
    }
    return store;
  }

//Delete
  Future<void> delStore(DocumentReference reference) async {
    await reference.delete();
  }

//Update
  Future<void> updateStore(Map<String, dynamic> json,DocumentReference reference) async {
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
