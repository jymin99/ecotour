import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:capstone/natureStory/storyWidget.dart';

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
                'https://i.ibb.co/ncpXZFG/2023-12-06-202432.png',
                '청계천(중구)-북한산(강북구) (1박2일)',
                '북한산: 첫째 날에는 청계천을 따라 산책하고, 둘째 날에는 북한산을 등산하는 코스를 추천합니다. 청계천에 인접한 호텔에서 첫 날을 보내고, 아침에 북한산으로 이동하여 등산을 즐길 수 있습니다. 청계천과 북한산은 서울에서 쉽게 접근할 수 있는 곳으로, 자연과 함께 보호하며 즐길 수 있는 경로입니다.한강 자전거 여행 - 서울 숲: 첫째 날에는 한강을 따라 자전거를 타고 여행하고, 둘째 날에는 서울 숲을 방문하는 코스를 추천합니다. 한강에 인접한 호텔에서 첫 날을 보내고, 아침에 한강을 따라 자전거 여행을 즐길 수 있습니다. 둘째 날에는 서울 숲에서 산책하거나 휴식을 취할 수 있습니다. 이 경로는 활동적인 여행을 선호하는 분들에게 적합합니다.',
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/LZbC5Ct/2023-12-06-204340.png',
                '뚝섬한강공원(광진구)-서울숲(성동구)\n(1박 2일)',
                '한강 자전거 여행 - 서울 숲: 첫째 날에는 한강을 따라 자전거를 타고 여행하고, 둘째 날에는 서울 숲을 방문하는 코스를 추천합니다. 한강에 인접한 호텔에서 첫 날을 보내고, 아침에 한강을 따라 자전거 여행을 즐길 수 있습니다. 둘째 날에는 서울 숲에서 산책하거나 휴식을 취할 수 있습니다. 이 경로는 활동적인 여행을 선호하는 분들에게 적합합니다.\n뚝섬 한강공원에서 서울숲까지는 자전거로 22분밖에 안걸림으로 자전거로 이동하는 것도 추천합니다.',
              ),

              SizedBox(height:10,),
              buildStoryContainer(
                context,
                'https://i.ibb.co/6vhdyTB/2023-12-06-204740.png',
                '서울시립 동물원(과천) - 광화문 광장(중구)\n(1박 2일)',
                '첫째 날에는 서울시립 동물원을 방문하고, 둘째 날에는 광화문 광장을 탐방하는 코스를 추천합니다. 첫 날에는 동물원에서 동물들을 관찰하고, 환경 보호에 대한 이해를 높일 수 있습니다. 둘째 날에는 광화문 광장에서 역사와 문화를 체험하며 도시의 녹색 공간을 즐길 수 있습니다.',
              ),
              SizedBox(height: 10,),
              buildStoryContainer(
                context,
                'https://i.ibb.co/rpHnWMV/2023-12-06-205132.png',
                '양재천(강남구) - 서울 숲(성동구)(1박 2일)',
                '첫째날에는 양재천을 탐방하고 자연과 함께 시간을 보낼 수 있습니다. 둘째 날에는 서울 숲에서 산책하고, 푸른 자연 속에서 휴식을 취할 수 있습니다.',
              ),


              // Other widgets can be added here
            ],
          ),
        ),
      ),
    );
  }
}