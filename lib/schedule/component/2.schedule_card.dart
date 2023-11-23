import 'package:capstone/schedule/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTimeH;
  final int startTimeM;
  final int endTimeH;
  final int endTimeM;
  final String memo;
  final String title;
  final String place;

  const ScheduleCard({
    required this.startTimeH,
    required this.startTimeM,
    required this.endTimeH,
    required this.endTimeM,
    required this.memo,
    required this.title,
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 1.0,
        //   color: AppColor.deepGreen,
        // ),
        borderRadius: BorderRadius.circular(8.0),
        color: AppColor.ashGreen,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 15.0,
        ),
        child: IntrinsicHeight(  // ➊ 높이를 내부 위젯들의 최대 높이로 설정
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 10.0),
              _Time(   // ➋ 시작과 종료 시간을 보여줄 위젯
                startTimeH: startTimeH,
                startTimeM: startTimeM,
                endTimeH: endTimeH,
                endTimeM: endTimeM,
              ),
              SizedBox(width: 20.0),
              _Content(   // ➌ 일정 내용을 보여줄 위젯
                title: title,
                place: place,
                memo: memo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _Time extends StatelessWidget {
  final int startTimeH;  // ➊ 시작 시간
  final int startTimeM;  // ➊ 시작 시간
  final int endTimeH;    // ➋ 종료 시간
  final int endTimeM;    // ➋ 종료 시간

  const _Time({
    required this.startTimeH,
    required this.startTimeM,
    required this.endTimeH,
    required this.endTimeM,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColor.deepGreen,
      fontSize: 15.0,
    );

    return Column(  // ➌ 시간을 위에서 아래로 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTimeH.toString().padLeft(2, '0')}:${startTimeM.toString().padLeft(2, '0')}',  // 숫자가 두 자리수가 안 되면 0으로 채워주기
          style: textStyle,
        ),
        Text(
          '- ${endTimeH.toString().padLeft(2, '0')}:${endTimeM.toString().padLeft(2, '0')}', // 숫자가 두 자리수가 안 되면 0으로 채워주기
          style: textStyle.copyWith(
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String memo;  // ➊ 내용
  final String title;  // ➊ 내용
  final String place;  // ➊ 내용

  const _Content({
    required this.memo,
    required this.title,
    required this.place,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15, // 글씨 크기 조절
                fontWeight: FontWeight.bold, // 글씨 굵기 설정
              ),
            ),
            Spacer(), // 여백을 균등하게 나누는 위젯
            Row(
              children: [
                Icon(
                  Icons.location_on, // 여기에 사용할 아이콘을 선택하세요.
                  size: 14, // 아이콘 크기 조절
                ),
                Text(
                  place,
                  style: TextStyle(
                    fontSize: 12, // 글씨 크기 조절
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 15, // 글씨 크기 조절
  //             fontWeight: FontWeight.bold, // 글씨 굵기 설정
  //           ),
  //         ),
  //
  //         Row(
  //           children: [
  //             Icon(
  //               Icons.location_on, // 여기에 사용할 아이콘을 선택하세요.
  //               size: 14, // 아이콘 크기 조절
  //             ),
  //             Text(
  //               place,
  //             ),
  //           ],
  //         ),
  //     ]
  //   );
  // }
}
