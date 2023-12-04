import 'package:capstone/myAccount/accountInfo.dart';
import 'package:flutter/material.dart';
import 'logoutPage.dart';
import 'quitPage.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SettingDetail(),
    );
  }
}

class SettingDetail extends StatefulWidget {
  const SettingDetail({super.key});

  @override
  State<SettingDetail> createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView(
        children: [
          ListTile(
            title: Text('계정 정보'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountInfo()));
            },
          ),
          ListTile(
            title: Text('로그아웃'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogoutPage()));
              },
          ),
          ListTile(
            title: Text('회원 탈퇴'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuitPage()));
            },
          ),
        ],

      ),
    );
  }
}
