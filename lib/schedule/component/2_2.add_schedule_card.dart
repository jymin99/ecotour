
import 'package:flutter/material.dart';
import 'package:capstone/schedule/component/custom_text_field.dart';
import 'package:capstone/schedule/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';


class dayPlanSheet extends StatefulWidget {
  const dayPlanSheet({super.key});


  @override
  State<dayPlanSheet> createState() => _dayPlanSheetState();
}

class _dayPlanSheetState extends State<dayPlanSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();

  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  String? content; // 제목을 저장할 변수

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: formkey, // form을 조작할 키 값.
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            // height:420,

            child: SingleChildScrollView(
              child: SizedBox(
                // width: 800.0, // 원하는 폭 설정
                // height: 500.0,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      width: 283,
                      child: TextField(
                        onChanged: (String value) {
                          content = value; // 입력된 제목을 변수에 저장
                        },
                        decoration: InputDecoration(
                          labelText: '여행 제목',
                          labelStyle: TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.never, // Disable floating label
                          prefixIcon: const Icon(Icons.search, color: Colors.black), // 돋보기 아이콘 추가 및 색상 설정
                          filled: true, // 배경색 적용
                          fillColor: Colors.grey[200], // 배경색 설정
                          border: OutlineInputBorder( // 텍스트 필드의 테두리 스타일 설정
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none, // 테두리 없음
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      //height: size.width * 0.80,
                      width: size.width * 0.80,
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
                              cellMargin : const EdgeInsets.all(1.0),
                              cellPadding : const EdgeInsets.all(0.0),

                            ),

                          ),
                          // 여기에 다른 위젯을 추가할 수 있음
                        ],
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onSavePressed,
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.deepGreen,
                        ),
                        child: Text('저장'),
                      ),
                    ),
                    SizedBox(height:10,),




                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    if(formkey.currentState!.validate()){ //폼 검증
      formkey.currentState!.save(); //폼 저장

      // print(startTime);
      // print(endTime);
      // print(content);

    }
  }

  String? contentValidator(String? val){ //
    if (val==null||val.isEmpty==true){
      return '값을 입력해주세요';
    }

    return null;
  }

}
