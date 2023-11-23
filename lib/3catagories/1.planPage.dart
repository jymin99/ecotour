// home_screen.dart
import 'package:get_it/get_it.dart';
import 'package:capstone/schedule/database/drift_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:capstone/schedule/component/1.dayPlan_dialog_sheet.dart';
import 'package:capstone/schedule/component/2.schedule_card.dart';
import 'package:capstone/schedule/component/3.today_banner.dart';
import 'package:capstone/schedule/const/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';//일정 DB에 저장된 데이터 가져오기

import 'package:capstone/schedule/component/main_calendar.dart';

class PlanPage extends StatefulWidget {  // ➊ StatelessWidget에서 StatefulWidget으로 전환
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;

  String input = "";



  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(  // ➊ 새 일정 버튼
        backgroundColor: AppColor.yellowGreen,
        onPressed: () {
          showCupertinoModalPopup(  // ➋ BottomSheet 열기
            context: context,
            builder: (_) => dayPlanSheet(
              selectedDate: selectedDate,
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,

        ),
      ),
      body: SafeArea(   // 시스템 UI 피해서 UI 구현하기
        child: Column(  // 달력과 리스트를 세로로 배치
          children: [
            MainCalendar(
              selectedDate: selectedDate,  // 선택된 날짜 전달하기
              onDaySelected: onDaySelected, // 날짜가 선택됐을 때 실행할 함수
            ),
            SizedBox(height: 8.0),
            TodayBanner(  // ➊ 배너 추가하기
              selectedDate: selectedDate,
              count: 0,
            ),
            SizedBox(height: 8.0),

            Expanded(
                // width: 390,
                // height: 80,
                child: StreamBuilder<List<Schedule>>(
                  stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Container();
                    }
                    return  ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        final schedule = snapshot.data![index];
                        return Dismissible(
                          key: ObjectKey(schedule.id), //유니크한 키 값
                          direction: DismissDirection.startToEnd,
                          onDismissed: (DismissDirection direction){
                            GetIt.I<LocalDatabase>().removeSchedule(schedule.id);
                            // 화면 갱신
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                            child: ScheduleCard(
                              startTimeH: schedule.startTimeH,
                              startTimeM: schedule.startTimeM,
                              endTimeH: schedule.endTimeH,
                              endTimeM: schedule.endTimeM,
                              title: schedule.title,
                              place: schedule.place,
                              memo: schedule.memo,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
            ),

            // SizedBox(
            //   width: 390,
            //   height: 35,
            //   // width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: (){
            //       showCupertinoModalPopup(  // ➋ BottomSheet 열기
            //         context: context,
            //         builder: (_) => dayPlanSheet(
            //           selectedDate: selectedDate,
            //         ),
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //       primary: AppColor.ashGreen,
            //     ),
            //     child: Text(
            //       '+',
            //       style: TextStyle(
            //         color: AppColor.deepGreen,  // 텍스트 색상을 검정색으로 변경
            //         fontSize: 20.0,       // 텍스트 크기를 조절
            //       ),
            //     ),
            //   ),
            // ),
            //
            // SizedBox(height: 50.0),

          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){  // ➌ 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}