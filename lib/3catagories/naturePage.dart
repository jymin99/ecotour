import 'package:flutter/material.dart';
import 'package:capstone/nature/1_certificationFeed.dart';
import 'package:capstone/nature/2_ecoFriendlyItems.dart';
import 'package:capstone/nature/3_pointUsageHistory.dart';
import 'package:capstone/style.dart';

class NaturePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _NaturePage();
  }
}

class _NaturePage extends State<NaturePage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: TabBar(
            controller: controller,
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.collections),
                child: Text(
                  "인증피드",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),

              Tab(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.compost),
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 원하는 여백 크기를 여기에 지정
                    Text(
                      "친환경품",
                      style: TextStyle(
                        fontSize: 11.0, // 글씨 크기
                        fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                        fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                      ),
                    ),
                  ],
                ),
              ),

              Tab(
                icon: Icon(Icons.credit_card),
                child: Text(
                  "포인트내역",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    //fontFamily: 'Lotte', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),
            ],
            labelColor: AppColor.deepGreen, // 선택된 탭의 글씨색
            indicatorColor: AppColor.deepGreen, // 탭 아래의 인디케이터 색
            /// 탭바 클릭시 나오는 splash effect 컬러
            overlayColor: const MaterialStatePropertyAll(
              Colors.transparent,
            ),
          ),
        ),
        body: TabBarView(
          controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CertificationFeed(),
            EcoFriendlyItems(),
            // AppItems(),
            PointUsageHistory(),
          ],
        ),
      ),
    );
  }
}



