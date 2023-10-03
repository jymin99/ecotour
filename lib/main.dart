// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:capstone/main/homePage.dart';
import 'package:capstone/mainPage.dart';
import 'package:capstone/style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'mainPage.dart';
import 'package:get/get.dart';
// import 'package:modu_tour/singPage.dart';
import 'login.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: 'fd5d11f7f28cc940b19167e60572b61a');
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:'에코투어',
      theme: ThemeData(
        //primarySwatch: Color.green,
        fontFamily: 'Pretendard',
      ),
      /*initialRoute: '/',
      routes:{
        '/':(context)=>Login(),
        //'/sign':(context) =>SignPage(),
    },*/
      home:MainPage(),
    );
  }
}