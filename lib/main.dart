// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:capstone/schedule/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
// import 'home_screen.dart';
import 'package:get/get.dart';
// import 'package:modu_tour/singPage.dart';
import 'login.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: 'fd5d11f7f28cc940b19167e60572b61a');
  AuthRepository.initialize(appKey: '8f37b8519ce307bd4d312e00c20fbe41');

  // MobileAds.instance.initialize();

  await initializeDateFormatting();


  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return GetMaterialApp(
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
      // LoginPage(),
    );
  }
}





