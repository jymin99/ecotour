import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CertificationFeed extends StatelessWidget {
  const CertificationFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedList(),
    );
  }
}


class FeedList extends StatefulWidget {
  // const FeedList({super.key});
  // final FirebaseFiresotre db=FirebaseFirestore.instance;
  // List<FeedDetail> details=[];

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


