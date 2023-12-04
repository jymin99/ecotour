import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '서울의 친환경 숙소 TOP 10',
                '내용',
                1,
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '1박 2일 국내 여행 시 배출되는 탄소량은?',
                '내용',
                1,
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '제목',
                '내용',
                1,
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/59yWycP/hotel.jpg',
                '제목',
                '내용',
                1,
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

Widget buildStoryContainer(BuildContext context, imageUrl, String title, String subtitle, int i) {
  return InkWell(
    onTap: () {
      if (i == 1) {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => story1(),
        );
      }
    },
    child: Container(
      width: 390,
      height: 120,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: Colors.grey, // 테두리 색상
          width: 2, // 테두리 두께
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}



class story1 extends StatelessWidget {
  const story1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80,),
        Container(
          height: 580,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white, // 배경색을 흰색으로 설정
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 그림자 색상
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 0), // 그림자 위치 조절
              ),
            ],
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height:10,),

                Image.network(
                  'https://i.ibb.co/59yWycP/hotel.jpg', // 이미지 URL을 지정하세요.
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                  // alignment: Alignment.centerLeft, // 이미지를 왼쪽으로 정렬// 이미지를 채울 방식을 지정하세요.
                ),

                SizedBox(height:10,),

                Text(
                  '환경 생각하는 호텔업계, 친환경 콘셉트 강화',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "최근 지속 가능한 여행 문화 및 친환경 여행, 친환경 호텔에 대한 소비자들의 관심이 높아짐에 따라 호텔업계가 환경을 생각하는 다양한 친환경 콘셉트 패키지와 프로모션을 강화하고 있다.\n29일 코트야드 메리어트 서울 남대문 호텔에 따르면 호텔은 아르티장 비건 뷰티 브랜드 아렌시아(Arencia)와 함께 '노 플라스틱, 노 카(No Plastic, No Car)'를 콘셉트로 오는 10월 1일부터 12월 31일까지 ‘에코 트래블 위드 노 카(Eco Travel with No Car) 패키지’를 공개한다. ‘에코 트래블 위드 노 카 패키지’는 ESG(환경, 사회, 지배구조) 캠페인의 일환으로 기획되어 투숙 시 주차가 불가하다. 호텔 방문 시 자가용 대신 도보 및 대중교통 이용을 장려하여 일상 생활에서 발생하는 온실 가스를 줄이는 '탄소발자국 줄이기 캠페인'에 동참하는 상품이다. \n글래드 여의도는 친환경 생수 브랜드 ‘아임에코(i’m eco)’의 고마운샘 생수를 이용해 환경보호에 앞장선다. 아임에코 고마운샘은 사탕수수, 옥수수 등 식물 유래 소재를 사용하여 환경호르몬으로부터 안전하며, 재생 원료를 기반으로 생분해가 가능한 농업용 제초필름으로 재생산, 선별 회수 후 바이오 연료 생성을 위한 원재료로 재활용할 수 있는 것이 특징이다. 글래드 호텔은 지난 8월부터 일부 객실 내 친환경 분리수거 휴지통을 비치하여 호캉스를 즐기면서 친환경 활동도 할 수 있는 착한 호캉스 캠페인을 진행하고 있다.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),

                SizedBox(height: 10,),
                

                ElevatedButton(
                  onPressed: (){
                    // 닫기 버튼이 눌렸을 때 수행할 동작을 여기에 추가
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.lightYellowGreen, // 배경 색상
                    minimumSize: Size(350, 30), // 최소 가로, 세로 크기 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 원하는 둥근 정도 설정
                    ),
                  ),
                  child: Text('닫기', style: TextStyle(color:Colors.black, ),),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20,)
      ],
    );


  }
}