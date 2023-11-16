import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:capstone/style.dart';
import 'package:capstone/3catagories/naturePage.dart';
import 'package:capstone/3catagories/mapPage.dart';
import 'package:capstone/3catagories/planPage.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:capstone/schedule/component/main_calendar.dart';
import 'package:capstone/schedule/component/schedule_card.dart';
import 'package:capstone/schedule/component/today_banner.dart';
// import 'package:capstone/schedule/component/schedule_bottom_sheet.dart';
import 'package:capstone/schedule/component/schedule_dialog_sheet.dart';
import 'package:capstone/schedule/const/colors.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}


class _MainPage extends State<MainPage> {
  int _selectedIndex = 1; // Index of the selected tab
  IconData _floatingButtonIcon = Icons.edit_calendar; // Default icon

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;


  final List<Widget> _pages = [
    const MapPage(),
    const PlanPage(),
    NaturePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



void _showCustomDialog(BuildContext context) {
  String title = ''; // 제목을 저장할 변수

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox( // 내용을 감싸는 컨테이너에 폭 설정
              width: 800.0, // 원하는 폭 설정
              height: 450.0,
              child: Column(
                children: [
                  TextField(
                    onChanged: (String value) {
                      title = value; // 입력된 제목을 변수에 저장
                    },
                    decoration: InputDecoration(
                      labelText: '제목',
                      prefixIcon: const Icon(Icons.search, color: Colors.black), // 돋보기 아이콘 추가 및 색상 설정
                      filled: true, // 배경색 적용
                      fillColor: Colors.grey[200], // 배경색 설정
                      border: OutlineInputBorder( // 텍스트 필드의 테두리 스타일 설정
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // 테두리 없음
                      ),
                    ),
                  ),

                  // TextField(
                  //   onChanged: (String value) {
                  //     title = value; // 입력된 제목을 변수에 저장
                  //   },
                  //   decoration: InputDecoration(labelText: '제목'),
                  // ),

                  Container(
                    margin: const EdgeInsets.only(right: .0, left: 4.0, top:20.0),

                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        TableCalendar(
                          formatAnimationDuration: const Duration(milliseconds: 220),
                          locale: 'ko_KR',
                          firstDay: DateTime.utc(2021, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: focusedDay,
                          calendarFormat: _calendarFormat,
                          availableCalendarFormats: const {
                            CalendarFormat.month: 'month',
                            CalendarFormat.twoWeeks: 'week',
                          },
                          onFormatChanged: (format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          },
                          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                            // 선택된 날짜의 상태를 갱신합니다.
                            setState((){
                              this.selectedDay = selectedDay;
                              this.focusedDay = selectedDay;
                            });
                          },
                          selectedDayPredicate: (DateTime day) {
                            // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                            return isSameDay(selectedDay, day);
                          },
                          headerStyle: const HeaderStyle(
                            headerPadding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                            titleCentered: true,
                            titleTextStyle: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),

                          calendarStyle: CalendarStyle(
                            // 이전 달 날짜의 스타일 설정
                            outsideTextStyle: TextStyle(fontSize: 12, color: Colors.grey),
                            // outsideDecoration: BoxDecoration(), // 이전 달 날짜의 배경 스타일

                            // 오늘 날짜의 스타일 설정
                            todayTextStyle: TextStyle(fontSize: 12, color: Colors.white),
                            // todayDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow), // 오늘 날짜의 배경 스타일

                            defaultTextStyle: TextStyle(fontSize: 12.0), // 기본 날짜 숫자의 폰트 크기
                            weekendTextStyle: TextStyle(fontSize: 12.0, color: Colors.red), // 주말의 날짜 숫자 폰트 크기와 색상
                            // selectedDay 글자 조정
                            selectedTextStyle : TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                            // selectedDay 모양 조정
                             selectedDecoration: BoxDecoration(  // ➍ 선택된 날짜 스타일
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: AppColor.yellowGreen,
                                width: 1.0,
                              ),
                            ),
                            cellMargin: EdgeInsets.all(0.0), // 셀 주위 여백 설정
                            cellPadding: EdgeInsets.all(0.0), // 셀 내부 여백 설정
                          ),

                          daysOfWeekStyle: const DaysOfWeekStyle(
                            // 요일 텍스트 스타일
                            weekdayStyle: TextStyle(fontSize: 13.0), // 평일 요일의 스타일
                            weekendStyle: TextStyle(fontSize: 13.0), // 주말 요일의 스타일
                          ),

                        ),
                        // 여기에 다른 위젯을 추가할 수 있음
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            '그린패스',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle, color: Colors.black),
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomAppBar(
          color: Colors.white, // 네비게이션 바의 배경색
          shape: const CircularNotchedRectangle(), // 테두리를 둥글게 만듭니다.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                        _floatingButtonIcon = Icons.edit_calendar;
                      });
                    },
                    child: Text(
                      '관광지도',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 0 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                        _floatingButtonIcon = Icons.edit_calendar;
                      });
                    },
                    child: Text(
                      '환경스토어',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 2 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _selectedIndex ==1 ? Container()
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColor.lightGreen,
            onPressed: () {
              _floatingButtonIcon = _selectedIndex == 1 ? Icons.edit_calendar : Icons.add;
              if (_selectedIndex == 1) {
                // 현재 페이지가 인덱스 1 (PlanPage)인 경우
                // 정보 입력 및 페이지 업데이트 동작 수행
                // _showCustomDialog(context);

                // showDialog(
                //     context: context,
                //     builder: (_) => ScheduleBottomSheet(),
                // );

                // 정보 입력 다이얼로그 표시
                showCupertinoModalPopup(  // ➋ BottomSheet 열기
                  context: context,
                  builder: (_) => ScheduleBottomSheet(),
                );


              } else {
                setState(() {
                   _selectedIndex = 1; // 현재 페이지가 인덱스 1이 아닐 때는 PlanPage로 이동
                });
              }
            },
            child: Column(
                children: [
                  Container(height: 17,),
                  Icon(_floatingButtonIcon, color: Colors.black, size: 23,),
                ]
            ),
          ),
        ),
      ),

    );
  }
}



//
// void _showInputDialog(BuildContext context) {
//   String title = ''; // 제목을 저장할 변수
//   DateTime selectedDate = DateTime.now(); // 달력 기간을 저장할 변수
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Center(
//         child: Container(
//           height: 500,
//           width: 600,
//           child: AlertDialog(
//             title: Text('계획 추가'),
//             // insetPadding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 0.0),
//             content: Column(
//               children: [
//                 TextField(
//                   onChanged: (String value) {
//                     title = value; // 입력된 제목을 변수에 저장
//                   },
//                   decoration: InputDecoration(labelText: '제목'),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // 다이얼로그 닫기
//                 },
//                 child: Text('Close'),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }


