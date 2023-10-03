import 'package:capstone/style.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '글 수정',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.deepGreen,
      ),
    );
  }
}

