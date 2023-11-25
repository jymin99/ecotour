// component/main_calendar.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:capstone/schedule/const/colors.dart';

import 'package:get_it/get_it.dart';
import 'package:capstone/schedule/database/drift_database.dart';


class MainCalendar extends StatefulWidget {
  final OnDaySelected onDaySelected; // ➊ 날짜 선택 시 실행할 함수
  final DateTime selectedDate; // ➋ 선택된 날짜
  // final Set<DateTime> markedDates; // ➊ Set 추가
  final List<DateTime> dates; // ➊ Set 추가\

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
    // required this.markedDates,
    required this.dates,
  });

  @override
  State<MainCalendar> createState() => _MainCalendarState();
}

class _MainCalendarState extends State<MainCalendar> {
  late DateTime _focusedDay;
  List<DateTime> allDates=[]; // ➊ Set 추가\


  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();

    GetIt.I<LocalDatabase>().getAllScheduleDates().listen((dates) {
      dates = dates.toSet().toList();
      allDates=dates;
    });
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
    print('Datas in build: $allDates');

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
            focusedDay: widget.selectedDate,

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


            calendarBuilders: CalendarBuilders(
              // markerBuilder: (BuildContext context, date, allDates) {
              //   if (widget.dates.length > 0 && date == widget.dates[0]) {
              //     return Positioned(
              //       top: 20.0, // 원하는 위치로 조절
              //       child: Container(
              //         width: 5,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.red,
              //         ),
              //       ),
              //     );
              //   }
              //   return SizedBox(); // dates 목록에 있는 경우에만 마커를 표시합니다.
              // },


              markerBuilder: (BuildContext context, date, allDates) {
                if (allDates.contains(date)) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                return SizedBox(); // No markers for this date.
              },


              // markerBuilder: (BuildContext context, date, dates) {
              //   if (dates.isEmpty) return SizedBox(); // No markers for this date.
              //
              //   // Check if the date is in the markedDates set.
              //   if (dates.contains(date)) {
              //     return ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: dates.length,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           margin: const EdgeInsets.only(top: 20),
              //           padding: const EdgeInsets.all(1),
              //           child: Container(
              //             width: 5,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.red,
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   }
              //   return SizedBox(); // No markers for this date.
              // },
              //

            ),

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
  }
}



