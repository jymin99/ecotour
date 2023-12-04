import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:capstone/nature/storyWidget.dart';

import 'package:capstone/style.dart';

class Story2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Story2();
  }
}

class _Story2 extends State<Story2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildStoryContainer(
                context,
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '송파 여행 루트(1박2일)',
                '내용',
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '종로 여행 루트(1박 2일)',
                '내용',
              ),

              SizedBox(height:10,),


              // Other widgets can be added here
            ],
          ),
        ),
      ),
    );
  }
}