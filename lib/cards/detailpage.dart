// import 'package:capstone/cards/updatepage.dart';
// import 'package:capstone/cards/writepage.dart';
// import 'package:capstone/style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// // import '../main/homePage.dart';
//
// class DetailPage extends StatelessWidget{
//   final int id;
//
//   const DetailPage(this.id);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.deepGreen,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('글 제목',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             Divider(),
//             Row(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(AppColor.newGreen),
//                   ),
//                     child: Text('삭제'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                     onPressed: () {
//                       Get.to(UpdatePage());
//                     },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(AppColor.newGreen),
//                   ),
//                     child: Text('수정'),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text('글 내용'),
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
