import 'package:flutter/material.dart';
import 'package:capstone/schedule/component/custom_text_field.dart';
import 'package:capstone/schedule/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';


class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});


@override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();

  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime(
    DateTime
        .now()
        .year,
    DateTime
        .now()
        .month,
    DateTime
        .now()
        .day,
  );

  String title = ''; // 제목을 저장할 변수


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: formkey, // form을 조작할 키 값.
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.zero, // 여백을 제거
            // width: 400,
            height: 400, // ➋ 화면 반 높이에 키보드 높이 추가하기
          ),
        ),
      ),
    );
  }
}


//
//
//       Center(
//       child: Form(
//         key: formkey,
//         child: SafeArea(
//           child: AlertDialog(
//             content: SingleChildScrollView(
//               child: SizedBox(
//                 width: 400.0, // 원하는 폭 설정
//                 height: 450.0,
//                 child: Column(
//                   children: [
//
//                     // TextField(
//                     //   onChanged: (String value) {
//                     //     title = value; // 입력된 제목을 변수에 저장
//                     //   },
//                     //   decoration: InputDecoration(
//                     //     labelText: '제목',
//                     //     prefixIcon: const Icon(Icons.search, color: Colors.black), // 돋보기 아이콘 추가 및 색상 설정
//                     //     filled: true, // 배경색 적용
//                     //     fillColor: Colors.grey[200], // 배경색 설정
//                     //     border: OutlineInputBorder( // 텍스트 필드의 테두리 스타일 설정
//                     //       borderRadius: BorderRadius.circular(10.0),
//                     //       borderSide: BorderSide.none, // 테두리 없음
//                     //     ),
//                     //   ),
//                     // ),
//                     //
//                     //
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: .0, left: 4.0, top:20.0),
//                     //
//                     //   padding: const EdgeInsets.all(5.0),
//                     //   decoration: BoxDecoration(
//                     //     border: Border.all(
//                     //       color: Colors.grey,
//                     //       width: 2.0,
//                     //     ),
//                     //     borderRadius: BorderRadius.circular(10.0),
//                     //   ),
//                     //   child: Column(
//                     //     children: [
//                     //       TableCalendar(
//                     //         formatAnimationDuration: const Duration(milliseconds: 220),
//                     //         locale: 'ko_KR',
//                     //         firstDay: DateTime.utc(2021, 1, 1),
//                     //         lastDay: DateTime.utc(2030, 12, 31),
//                     //         focusedDay: focusedDay,
//                     //         calendarFormat: _calendarFormat,
//                     //         availableCalendarFormats: const {
//                     //           CalendarFormat.month: 'month',
//                     //           CalendarFormat.twoWeeks: 'week',
//                     //         },
//                     //         onFormatChanged: (format) {
//                     //           setState(() {
//                     //             _calendarFormat = format;
//                     //           });
//                     //         },
//                     //         onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
//                     //           // 선택된 날짜의 상태를 갱신합니다.
//                     //           setState((){
//                     //             this.selectedDay = selectedDay;
//                     //             this.focusedDay = selectedDay;
//                     //           });
//                     //         },
//                     //         selectedDayPredicate: (DateTime day) {
//                     //           // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
//                     //           return isSameDay(selectedDay, day);
//                     //         },
//                     //         headerStyle: const HeaderStyle(
//                     //           headerPadding:
//                     //           EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                     //           titleCentered: true,
//                     //           titleTextStyle: TextStyle(
//                     //             fontSize: 13.0,
//                     //             color: Colors.black,
//                     //           ),
//                     //         ),
//                     //
//                     //         calendarStyle: const CalendarStyle(
//                     //           // 이전 달 날짜의 스타일 설정
//                     //           outsideTextStyle: TextStyle(fontSize: 12, color: Colors.grey),
//                     //           // outsideDecoration: BoxDecoration(), // 이전 달 날짜의 배경 스타일
//                     //
//                     //           // 오늘 날짜의 스타일 설정
//                     //           todayTextStyle: TextStyle(fontSize: 12, color: Colors.white),
//                     //           // todayDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow), // 오늘 날짜의 배경 스타일
//                     //
//                     //           defaultTextStyle: TextStyle(fontSize: 12.0), // 기본 날짜 숫자의 폰트 크기
//                     //           weekendTextStyle: TextStyle(fontSize: 12.0, color: Colors.red), // 주말의 날짜 숫자 폰트 크기와 색상
//                     //           // selectedDay 글자 조정
//                     //           selectedTextStyle : TextStyle(
//                     //             color: Colors.black,
//                     //             fontSize: 12.0,
//                     //           ),
//                     //           // selectedDay 모양 조정
//                     //           selectedDecoration : BoxDecoration(
//                     //             color: AppColor.yellowGreen,
//                     //             shape: BoxShape.rectangle,
//                     //           ),
//                     //           cellMargin: EdgeInsets.all(0.0), // 셀 주위 여백 설정
//                     //           cellPadding: EdgeInsets.all(0.0), // 셀 내부 여백 설정
//                     //         ),
//                     //
//                     //         daysOfWeekStyle: const DaysOfWeekStyle(
//                     //           // 요일 텍스트 스타일
//                     //           weekdayStyle: TextStyle(fontSize: 13.0), // 평일 요일의 스타일
//                     //           weekendStyle: TextStyle(fontSize: 13.0), // 주말 요일의 스타일
//                     //         ),
//                     //
//                     //       ),
//                     //       // 여기에 다른 위젯을 추가할 수 있음
//                     //     ],
//                     //   ),
//                     // ),
//                     //
//
//                   ],
//                 ),
//
//               ),
//             ),
//           ),
//         ),
//       ),
//     );


//
// void _showCustomDialog(BuildContext context) {
//   String title = ''; // 제목을 저장할 변수
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Center(
//         child: AlertDialog(
//           content: SingleChildScrollView(
//             child: SizedBox( // 내용을 감싸는 컨테이너에 폭 설정
//               width: 800.0, // 원하는 폭 설정
//               height: 450.0,
//               child: Column(
//                 children: [
//                   TextField(
//                     onChanged: (String value) {
//                       title = value; // 입력된 제목을 변수에 저장
//                     },
//                     decoration: InputDecoration(
//                       labelText: '제목',
//                       prefixIcon: const Icon(Icons.search, color: Colors.black), // 돋보기 아이콘 추가 및 색상 설정
//                       filled: true, // 배경색 적용
//                       fillColor: Colors.grey[200], // 배경색 설정
//                       border: OutlineInputBorder( // 텍스트 필드의 테두리 스타일 설정
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide.none, // 테두리 없음
//                       ),
//                     ),
//                   ),
//
//                   // TextField(
//                   //   onChanged: (String value) {
//                   //     title = value; // 입력된 제목을 변수에 저장
//                   //   },
//                   //   decoration: InputDecoration(labelText: '제목'),
//                   // ),
//
//                   Container(
//                     margin: const EdgeInsets.only(right: .0, left: 4.0, top:20.0),
//
//                     padding: const EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Column(
//                       children: [
//                         TableCalendar(
//                           formatAnimationDuration: const Duration(milliseconds: 220),
//                           locale: 'ko_KR',
//                           firstDay: DateTime.utc(2021, 1, 1),
//                           lastDay: DateTime.utc(2030, 12, 31),
//                           focusedDay: focusedDay,
//                           calendarFormat: _calendarFormat,
//                           availableCalendarFormats: const {
//                             CalendarFormat.month: 'month',
//                             CalendarFormat.twoWeeks: 'week',
//                           },
//                           onFormatChanged: (format) {
//                             setState(() {
//                               _calendarFormat = format;
//                             });
//                           },
//                           onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
//                             // 선택된 날짜의 상태를 갱신합니다.
//                             setState((){
//                               this.selectedDay = selectedDay;
//                               this.focusedDay = selectedDay;
//                             });
//                           },
//                           selectedDayPredicate: (DateTime day) {
//                             // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
//                             return isSameDay(selectedDay, day);
//                           },
//                           headerStyle: const HeaderStyle(
//                             headerPadding:
//                             EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                             titleCentered: true,
//                             titleTextStyle: TextStyle(
//                               fontSize: 13.0,
//                               color: Colors.black,
//                             ),
//                           ),
//
//                           calendarStyle: const CalendarStyle(
//                             // 이전 달 날짜의 스타일 설정
//                             outsideTextStyle: TextStyle(fontSize: 12, color: Colors.grey),
//                             // outsideDecoration: BoxDecoration(), // 이전 달 날짜의 배경 스타일
//
//                             // 오늘 날짜의 스타일 설정
//                             todayTextStyle: TextStyle(fontSize: 12, color: Colors.white),
//                             // todayDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow), // 오늘 날짜의 배경 스타일
//
//                             defaultTextStyle: TextStyle(fontSize: 12.0), // 기본 날짜 숫자의 폰트 크기
//                             weekendTextStyle: TextStyle(fontSize: 12.0, color: Colors.red), // 주말의 날짜 숫자 폰트 크기와 색상
//                             // selectedDay 글자 조정
//                             selectedTextStyle : TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                             // selectedDay 모양 조정
//                             selectedDecoration : BoxDecoration(
//                               color: AppColor.yellowGreen,
//                               shape: BoxShape.rectangle,
//                             ),
//                             cellMargin: EdgeInsets.all(0.0), // 셀 주위 여백 설정
//                             cellPadding: EdgeInsets.all(0.0), // 셀 내부 여백 설정
//                           ),
//
//                           daysOfWeekStyle: const DaysOfWeekStyle(
//                             // 요일 텍스트 스타일
//                             weekdayStyle: TextStyle(fontSize: 13.0), // 평일 요일의 스타일
//                             weekendStyle: TextStyle(fontSize: 13.0), // 주말 요일의 스타일
//                           ),
//
//                         ),
//                         // 여기에 다른 위젯을 추가할 수 있음
//                       ],
//                     ),
//                   ),
//
//
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // 다이얼로그 닫기
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }