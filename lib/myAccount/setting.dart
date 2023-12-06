// setting.dart
import 'package:capstone/myAccount/accountInfo.dart';
import 'package:capstone/schedule/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../login.dart';
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
// Modify the SettingDetail class

class SettingDetail extends StatefulWidget {
  const SettingDetail({super.key});

  @override
  State<SettingDetail> createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {

  void _handleLogout() async {
    // Show confirmation dialog
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('로그아웃 확인', style: TextStyle(fontWeight: FontWeight.bold,),)),
          content: Text('로그아웃하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false if not confirmed
              },
              child: Text('아니오'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true if confirmed
              },
              child: Text('예'),
            ),
          ],
        );
      },
    );

    // If user confirmed, proceed with logout
    if (confirmed == true) {
      // Perform any additional logout logic if needed

      // Navigate to LoginPage
      Get.offAll(() => LoginPage());
    }
  }

  // Add a method to show the account information dialog
  Future<void> _showAccountInfoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('계정 정보', style: TextStyle(fontWeight: FontWeight.bold,),)),
          content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, // Adjust the width as needed
              height: MediaQuery.of(context).size.height * 0.1, // Adjust the width as needed
              child: AccountDetail()
          ), // Display the AccountDetail widget in the AlertDialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  // Add this method to show a confirmation dialog
  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('회원 탈퇴 확인', style: TextStyle(fontWeight: FontWeight.bold,),)),
          content: Text('정말 탈퇴하시겠습니까?\n탈퇴시 모든 정보는 사라집니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () async {
                // Clear all schedules from the Drift database
                await GetIt.I<LocalDatabase>().deleteAllScheduleIds();

                // Update the UI of the PlanPage (assuming PlanPage is the calendar page)
                setState(() {});

                // Navigate to LoginPage
                Get.offAll(() => LoginPage());
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView(
        children: [
          ListTile(
            title: Text('계정 정보'),
            onTap: () {
              _showAccountInfoDialog(context); // Call the method to show the dialog
            },
          ),
          ListTile(
            title: Text('로그아웃'),
            onTap: () {
              _handleLogout();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogoutPage()));
            },
          ),
          ListTile(
            title: Text('회원 탈퇴'),
            onTap: () {
              _showConfirmationDialog();
              },
          ),
        ],
      ),
    );
  }
}
