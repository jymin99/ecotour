// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:capstone/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'mainPage.dart';
// import 'home_screen.dart';
import 'package:get/get.dart';
// import 'package:modu_tour/singPage.dart';
import 'login.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:capstone/schedule/database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:capstone/myAccount/accountInfo.dart';

void main()async{
  final String apiKey = "e5a748a8-d308-41d2-b844-a1608b770f39";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: 'fd5d11f7f28cc940b19167e60572b61a');
  // AuthRepository.initialize(appKey: '8f37b8519ce307bd4d312e00c20fbe41');

  // MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);//이미지 불러오기 위해서

  await initializeDateFormatting();

  final database = LocalDatabase(); //localdatabase 클래스를 인스턴스화
  GetIt.I.registerSingleton<LocalDatabase>(database);
  //getit에 데이터베이스 변수 주입하기(의존성 주입)
  //같은 database 변수를 getitI를 통해서 프로젝트 어디서든 사용할 수 있음.


  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
//GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:'그린패스',
      home:
      //MainPage(),
       LoginPage(),
    );
  }
}





