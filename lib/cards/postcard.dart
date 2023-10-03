import 'package:capstone/style.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  int number;

  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text('제목')
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}