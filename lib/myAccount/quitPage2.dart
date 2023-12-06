// // quitPage.dart
//
// import 'package:flutter/material.dart';
// import 'package:capstone/style.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../schedule/database/drift_database.dart'; // Import shared_preferences
//
// class QuitPage extends StatelessWidget {
//   const QuitPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60.0),
//         child: AppBar(
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: AppColor.deepGreen,
//             ),
//             onPressed: (){
//               Navigator.of(context).pop();
//             },
//           ),
//           elevation: 1,
//           backgroundColor: Colors.white,
//           title: const Text(
//             '회원 탈퇴',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: QuitPageDetail(),
//     );
//   }
// }
//
// class QuitPageDetail extends StatefulWidget {
//   const QuitPageDetail({super.key});
//
//   @override
//   State<QuitPageDetail> createState() => _QuitPageDetailState();
// }
//
//
// class _QuitPageDetailState extends State<QuitPageDetail> {
//   // Add this method to handle quitting
//   void _handleQuit() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Check if the user is currently logged in
//     bool isLoggedIn = prefs.containsKey('userLoggedIn') ? prefs.getBool('userLoggedIn')! : false;
//
//     // If the user is logged in, clear the data and perform additional quit logic
//     if (isLoggedIn) {
//       // 로그: SharedPreferences에 저장된 키 확인
//       print('Stored Keys before clearing: ${prefs.getKeys()}');
//
//       // Reset local information
//       prefs.clear(); // Clear all stored data
//
//       // Clear all schedules from the Drift database
//       await GetIt.I<LocalDatabase>().deleteAllScheduleIds();
//
//       // 로그: SharedPreferences에 저장된 키 확인
//       print('Stored Keys after clearing: ${prefs.getKeys()}');
//
//       // Perform any additional quit logic if needed
//     }
//
//     // Navigate back to the previous screen or any desired screen
//     Navigator.of(context).pop();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _handleQuit,
//           child: Text('회원 탈퇴'),
//         ),
//       ),
//     );
//   }
// }
