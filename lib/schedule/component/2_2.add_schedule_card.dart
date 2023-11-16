import 'package:capstone/schedule/const/colors.dart';
import 'package:flutter/material.dart';

class AddScheduledCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: AppColor.deepGreen,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(  // ➊ 높이를 내부 위젯들의 최대 높이로 설정
          child: Container(

          ),
        ),
      ),
    );
  }
}
