// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:capstone/mainPage.dart';
import 'package:flutter/material.dart';
import 'mainPage.dart';
// import 'package:modu_tour/singPage.dart';
// import 'login.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'그린패스',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch: Colors.blue, // 주요 색상 설정
      //     accentColor: Colors.green, // 강조 색상 설정
      //   ),// 강조 색상 (예: 버튼 클릭 시 등)
      //   // 여기에 다른 테마 속성들을 추가할 수 있습니다.
      // ),
      home:MainPage(),
    );
  }
}





