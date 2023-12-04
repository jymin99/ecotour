import 'package:capstone/nature/storyWidget.dart';
import 'package:flutter/material.dart';

import 'package:capstone/style.dart';

class Story extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Story();
  }
}

class _Story extends State<Story> {
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
                "최근 지속 가능한 여행 문화 및 친환경 여행, 친환경 호텔에 대한 소비자들의 관심이 높아짐에 따라 호텔업계가 환경을 생각하는 다양한 친환경 콘셉트 패키지와 프로모션을 강화하고 있다.\n29일 코트야드 메리어트 서울 남대문 호텔에 따르면 호텔은 아르티장 비건 뷰티 브랜드 아렌시아(Arencia)와 함께 '노 플라스틱, 노 카(No Plastic, No Car)'를 콘셉트로 오는 10월 1일부터 12월 31일까지 ‘에코 트래블 위드 노 카(Eco Travel with No Car) 패키지’를 공개한다. ‘에코 트래블 위드 노 카 패키지’는 ESG(환경, 사회, 지배구조) 캠페인의 일환으로 기획되어 투숙 시 주차가 불가하다. 호텔 방문 시 자가용 대신 도보 및 대중교통 이용을 장려하여 일상 생활에서 발생하는 온실 가스를 줄이는 '탄소발자국 줄이기 캠페인'에 동참하는 상품이다. \n글래드 여의도는 친환경 생수 브랜드 ‘아임에코(i’m eco)’의 고마운샘 생수를 이용해 환경보호에 앞장선다. 아임에코 고마운샘은 사탕수수, 옥수수 등 식물 유래 소재를 사용하여 환경호르몬으로부터 안전하며, 재생 원료를 기반으로 생분해가 가능한 농업용 제초필름으로 재생산, 선별 회수 후 바이오 연료 생성을 위한 원재료로 재활용할 수 있는 것이 특징이다. 글래드 호텔은 지난 8월부터 일부 객실 내 친환경 분리수거 휴지통을 비치하여 호캉스를 즐기면서 친환경 활동도 할 수 있는 착한 호캉스 캠페인을 진행하고 있다.",

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

