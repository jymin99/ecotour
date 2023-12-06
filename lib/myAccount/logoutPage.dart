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
    // Perform any additional logout logic if needed

    // Navigate to LoginPage
    Get.offAll(() => LoginPage());
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