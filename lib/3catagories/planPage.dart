import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:capstone/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';//일정 DB에 저장된 데이터 가져오기


class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  String input = "";

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0, top:10.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.deepGreen,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    TableCalendar(
                      formatAnimationDuration: Duration(milliseconds: 220),
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
                      headerStyle: HeaderStyle(
                        headerPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                        titleCentered: true,
                        titleTextStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),

                      calendarStyle: CalendarStyle(
                        // selectedDay 글자 조정
                        selectedTextStyle : const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        // selectedDay 모양 조정
                        selectedDecoration : const BoxDecoration(
                          color: AppColor.yellowGreen,
                          shape: BoxShape.rectangle,
                        ),

                        // cell margin, padding 조절
                        cellMargin : const EdgeInsets.all(2.0),
                        cellPadding : const EdgeInsets.all(0.0),

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
    );
  }
}
