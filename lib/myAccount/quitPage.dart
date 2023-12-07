// quitPage.dart

import 'package:flutter/material.dart';
import 'package:capstone/style.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../schedule/database/drift_database.dart';
import 'package:get/get.dart';
import '../login.dart';

class QuitPage extends StatelessWidget {
  const QuitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.deepGreen,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            '회원 탈퇴',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: QuitPageDetail(),
    );
  }
}

class QuitPageDetail extends StatefulWidget {
  const QuitPageDetail({super.key});

  @override
  State<QuitPageDetail> createState() => _QuitPageDetailState();
}

class _QuitPageDetailState extends State<QuitPageDetail> {

  // Add this method to show a confirmation dialog
  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('회원 탈퇴 확인')),
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

                await GetIt.I<LocalDatabase>().deleteAllFavorites();

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
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _showConfirmationDialog, // Call the confirmation dialog
          child: Text('회원 탈퇴'),
        ),
      ),
    );
  }
}
