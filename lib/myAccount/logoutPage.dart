import 'package:flutter/material.dart';
import 'package:capstone/style.dart';
import 'package:get/get.dart';
import '../login.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.deepGreen,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            '로그아웃',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: LogoutDetail(),
    );
  }
}

class LogoutDetail extends StatefulWidget {
  const LogoutDetail({super.key});

  @override
  State<LogoutDetail> createState() => _LogoutDetailState();
}

class _LogoutDetailState extends State<LogoutDetail> {
  // Add this method to handle logout
  void _handleLogout() async {
    // Show confirmation dialog
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그아웃 확인'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _handleLogout,
          child: Text('로그아웃'),
        ),
      ),
    );
  }
}
