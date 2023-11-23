// component/main_calendar.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:capstone/schedule/const/colors.dart';


class MainCalendar extends StatefulWidget {
  final OnDaySelected onDaySelected; // ➊ 날짜 선택 시 실행할 함수
  final DateTime selectedDate; // ➋ 선택된 날짜

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  State<MainCalendar> createState() => _MainCalendarState();
}

class _MainCalendarState extends State<MainCalendar> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
  }

  DateTime focusedDay = DateTime.now();
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          TableCalendar(
            formatAnimationDuration: Duration(milliseconds: 220),
            locale: 'ko_KR',
            // onDaySelected: widget.onDaySelected,
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                widget.onDaySelected(selectedDay, focusedDay);
              });
            },
            selectedDayPredicate: (date) =>
            date.year == widget.selectedDate.year &&
                date.month == widget.selectedDate.month &&
                date.day == widget.selectedDate.day,

            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,

            headerStyle: HeaderStyle(
              headerPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              titleCentered: true,
              titleTextStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),


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
            // onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            //   // 선택된 날짜의 상태를 갱신합니다.
            //   setState((){
            //     this.selectedDate = selectedDay;
            //     this.focusedDay = selectedDay;
            //   });
            // },

            // selectedDayPredicate: (DateTime day) {
            //   // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
            //   return isSameDay(widget.selectedDate, day);
            // },

            calendarStyle: CalendarStyle(
              // 오늘 날짜의 스타일 설정
              // todayTextStyle: TextStyle(fontSize: 15, color: Colors.white),

              // 기본 날짜 숫자의 폰트 크기
              defaultTextStyle: TextStyle(fontSize: 15.0),

              // 주말의 날짜 숫자 폰트 크기와 색상
              weekendTextStyle: TextStyle(fontSize: 15.0, color: Colors.red),


              todayDecoration : const BoxDecoration(
                color: AppColor.deepGreen,
                shape: BoxShape.circle,
              ),

              // selectedDay 글자 조정
              selectedTextStyle : const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              // selectedDay 모양 조정
              selectedDecoration : const BoxDecoration(
                color: AppColor.yellowGreen,
                shape: BoxShape.circle,
              ),

              // cell margin, padding 조절
              cellMargin : const EdgeInsets.all(5.5),
              cellPadding : const EdgeInsets.all(0.0),

            ),
          ),
        ],
      ),

      margin: EdgeInsets.symmetric(vertical: 10),
      // height: size.width * 0.80,
      width: size.width * 0.95,
      padding: EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x66000000),
            offset: Offset(0, 7),
            blurRadius: 24,
          ),
        ],
      ),
    );



    // return TableCalendar(
    //   locale: 'ko_kr',
    //   onDaySelected: onDaySelected,
    //   // ➌ 날짜 선택 시 실행할 함수
    //   selectedDayPredicate: (date) => // ➍ 선택된 날짜를 구분할 로직
    //   date.year == selectedDate.year &&
    //       date.month == selectedDate.month &&
    //       date.day == selectedDate.day,
    //   firstDay: DateTime(1800, 1, 1),  // ➊ 첫째 날
    //   lastDay: DateTime(3000, 1, 1),   // ➋ 마지막 날
    //   focusedDay: DateTime.now(),
    //   headerStyle: HeaderStyle(  // ➊ 달력 최상단 스타일
    //     titleCentered: true,  // 제목 중앙에 위치하기
    //     formatButtonVisible: false,  // 달력 크기 선택 옵션 없애기
    //     titleTextStyle: TextStyle(  // 제목 글꼴
    //       fontWeight: FontWeight.w700,
    //       fontSize: 16.0,
    //     ),
    //   ),
    //   calendarStyle: CalendarStyle(
    //     isTodayHighlighted: false,
    //     defaultDecoration: BoxDecoration(  // ➋ 기본 날짜 스타일
    //       borderRadius: BorderRadius.circular(6.0),
    //       color: LIGHT_GREY_COLOR,
    //     ),
    //     weekendDecoration: BoxDecoration(  // ➌ 주말 날짜 스타일
    //       borderRadius: BorderRadius.circular(6.0),
    //       color: LIGHT_GREY_COLOR,
    //     ),
    //     selectedDecoration: BoxDecoration(  // ➍ 선택된 날짜 스타일
    //       borderRadius: BorderRadius.circular(6.0),
    //       border: Border.all(
    //         color: PRIMARY_COLOR,
    //         width: 1.0,
    //       ),
    //     ),
    //     defaultTextStyle: TextStyle(  // ➎ 기본 글꼴
    //       fontWeight: FontWeight.w600,
    //       color: DARK_GREY_COLOR,
    //     ),
    //     weekendTextStyle: TextStyle(  // ➏ 주말 글꼴
    //       fontWeight: FontWeight.w600,
    //       color: DARK_GREY_COLOR,
    //     ),
    //     selectedTextStyle: TextStyle(  // ➐ 선택된 날짜 글꼴
    //       fontWeight: FontWeight.w600,
    //       color: PRIMARY_COLOR,
    //     ),
    //   ), // ➌ 화면에 보여지는 날
    // );
  }
}



