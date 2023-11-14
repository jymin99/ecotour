// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:capstone_git/models/feed_detail.dart';
//
// class FeedFirebase{
//   late CollectionReference feedReference;
//   late Stream<QuerySnapshot> feedStream;
//
//   Future initDb() async{
//     feedReference=FirebaseFirestore.instance.collection('feeds');//collection'feeds'reference
//     feedStream=feedReference.snapshots();
//   }
//   List<feed> getFeeds(AsyncSnapshot<QuerySnapshot> snapshot){
//     return snapshot.data!.docs.map((DocumentSnapshot document){
//       return Feed.fromSnapshot(document);
//     }).toList();
//   }
//   Future addFeed(Feed feed) async{
//     feedReference.add(feed.toMap());
//   }
//   Future updateFeed(Feed feed) async{
//     feed.reference?update(feed.toMap());
//   }
//   Future deleteFeed(Feed feed) async{
//     feed.reference?.delete();
//   }
// }