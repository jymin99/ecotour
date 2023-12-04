import 'package:capstone/nature/storyWidget.dart';
import 'package:flutter/material.dart';

import 'package:capstone/style.dart';

class DonationList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _DonationList();
  }
}

class _DonationList extends State<DonationList> {
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
                'https://i.ibb.co/rkbPf6C/1.png',
                '서울의 친환경 숙소 TOP 10',
                '내용',
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/rkbPf6C/1.png',
                '1박 2일 국내 여행 시 배출되는 탄소량은?',
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

