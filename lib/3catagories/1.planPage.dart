import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:capstone/style.dart';
import 'package:capstone/schedule/component/3.today_banner.dart';

import 'package:capstone/schedule/component/main_calendar.dart';
import 'package:capstone/schedule/component/2.schedule_card.dart';
import 'package:capstone/schedule/const/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:capstone/schedule/database/drift_database.dart';

import 'package:capstone/schedule/component/1_2.dayPlan_dialog_sheet.dart';

import 'package:cloud_firestore/cloud_firestore.dart';//일정 DB에 저장된 데이터 가져오기

// import 'package:capstone/schedule/component/2_2.add_schedule_card.dart';


class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  String input = "";

  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  // height: size.width * 0.80,
                  width: size.width * 0.95,
                  padding: EdgeInsets.all(11.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x12000000),
                        offset: Offset(0, 7),
                        blurRadius: 24,
                      ),
                    ],
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
                            this.selectedDate = selectedDay;
                            this.focusedDay = selectedDay;
                          });
                        },
                        selectedDayPredicate: (DateTime day) {
                          // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                          return isSameDay(selectedDate, day);
                        },
                        headerStyle: HeaderStyle(
                          headerPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          titleCentered: true,
                          titleTextStyle: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
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
                ),



              ),


              // SizedBox(height: 8.0),
              Container(
                width: 390,
                // 둥글게
                child: TodayBanner(  // ➊ 배너 추가하기
                  selectedDate: selectedDate,
                  count: 0,
                ),
              ),
              SizedBox(height: 8.0),



              // //일정데이터 읽기
              // Expanded(
              //     child: StreamBuilder<List<Schedule>>(
              //       stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              //       builder: (context, snapshot){
              //         if(!snapshot.hasData){
              //           return Container();
              //         }
              //
              //         return ListView.builder(
              //           itemCount: snapshot.data!.length,
              //           itemBuilder: (context,index){
              //             final schedule = snapshot.data![index];
              //             return Padding(
              //               padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              //               child: ScheduleCard(
              //                 startTime: schedule.startTime,
              //                 endTime: schedule.endTime,
              //                 content:schedule.content,
              //               ),
              //             );
              //           },
              //         );
              //       },
              //
              //     )
              // ),

              ScheduleCard(  // ➊ 구현해둔 일정 카드
                startTime: 12,
                endTime: 14,
                content: '프로그래밍 공부',
              ),

              SizedBox(height: 8.0),

              SizedBox(
                width: 390,
                height: 35,
                // width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                     showCupertinoModalPopup(  // ➋ BottomSheet 열기
                      context: context,
                      builder: (_) => dayPlanSheet(
                        selectedDate: selectedDate,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.ashGreen,
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: AppColor.deepGreen,  // 텍스트 색상을 검정색으로 변경
                      fontSize: 20.0,       // 텍스트 크기를 조절
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50.0),

            ],
          ),
        ),
      ),
    );
  }
}
