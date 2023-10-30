// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main/homePage.dart';
import 'main/planPage.dart';
import 'main/naturePage.dart';
import 'style.dart';

class MainPage extends StatefulWidget{
  // const MainPage({super.key});
  @override
  State<StatefulWidget> createState()=>_MainPage();
}

class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin{
  TabController? controller;
  // FirebaseDatabase? _database;
  // DatabaseReference? reference;
  // String _databaseURL='### 데이터 베이스 URL 넣기 ###';
  // String? id;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 3, vsync: this);
    // _database=FireBase(databaseURL:_databaseURL);
    // reference = _database!.reference();
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    // 로그인 할 때 전달 받은 아이디 값 저장.
    // id 변수는 String형이므로 as String으로 형변환 하도록 함.
    // 각 페이지로 이동할 때마다 이 값을 전달함.
    // id = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          '그린패스',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.account_circle,
                  color:Colors.black
              )
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // 선의 높이를 조절하려면 이 값을 변경
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black, // 선의 색상을 설정
                  width: 1.0, // 선의 두께를 설정
                ),
              ),
            ),
          ),
        ),
      ),



      body: TabBarView(
        controller: controller,
        children: <Widget>[
          // TabBarView에 채울 위젯들
          PlanPage(),
          HomePage(),
          NaturePage()
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            icon: Icon(Icons.edit_calendar),
            child: Text(
              "내 계획",
              style: TextStyle(
                fontSize: 11.0, // 글씨 크기
                fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
              ),
            ),
          ),
          Tab(
            icon: Icon(Icons.home),
            child: Text(
              "홈",
              style: TextStyle(
                fontSize: 11.0, // 글씨 크기
                fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
              ),
            ),
          ),
          Tab(
            icon: Icon(Icons.public),
            child: Text(
              "환경스토어",
              style: TextStyle(
                fontSize: 11.0, // 글씨 크기
                fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
              ),
            ),
          )
        ],
        labelColor:AppColor.newGreen,
        indicatorColor: AppColor.deepGreen,
        controller:controller,
      ));
  }
}