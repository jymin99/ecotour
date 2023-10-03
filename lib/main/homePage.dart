import 'package:flutter/material.dart';
import 'package:capstone/home/1_feed.dart';
import 'package:capstone/home/2_naturalAttractions.dart';
import 'package:capstone/home/3_planFeed.dart';
import 'package:capstone/style.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
                icon: Icon(Icons.groups),
                child: Text(
                  "피드",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),

              Tab(
                icon: Icon(Icons.park),
                child: Text(
                  "자연관광지",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.person_search),
                child: Text(
                  "계획참고",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),
              // Tab(
              //   text: "계획참고",
              //   icon: Icon(Icons.groups),
              // ),
            ],
            labelColor: AppColor.newGreen, // 선택된 탭의 글씨색
            indicatorColor: AppColor.deepGreen, // 탭 아래의 인디케이터 색

          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Feed(),
            NaturalAttractions(),
            PlanFeed(),
          ],
        ),
      ),
    );
  }
  }





//
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         body: TabBarView(
//           controller: controller,
//           children: <Widget>[
//             // TabBarView에 채울 위젯들
//             Feed(),
//             NaturalAttractions(),
//             PlanFeed()
//           ],
//         ),
//         bottomNavigationBar: TabBar(
//           tabs: const <Tab>[
//             Tab(
//               icon: Icon(Icons.collections),
//               child: Text(
//                 "피드",
//                 style: TextStyle(
//                   fontSize: 11.0, // 글씨 크기
//                   fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
//                   fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
//                 ),
//               ),
//             ),
//             Tab(
//               icon: Icon(Icons.park),
//               child: Text(
//                 "자연관광지",
//                 style: TextStyle(
//                   fontSize: 11.0, // 글씨 크기
//                   fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
//                   fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
//                 ),
//               ),
//             ),
//             Tab(
//               icon: Icon(Icons.groups),
//               child: Text(
//                 "계획참고",
//                 style: TextStyle(
//                   fontSize: 11.0, // 글씨 크기
//                   fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
//                   fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
//                 ),
//               ),
//             )
//           ],
//           labelColor:AppColor.newGreen,
//           indicatorColor: AppColor.deepGreen,
//           controller:controller,
//         )
//     );
//   }
// }


