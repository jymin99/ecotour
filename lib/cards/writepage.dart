import 'package:capstone/style.dart';
import 'package:flutter/material.dart';

class WritePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '글쓰기',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,),
        ),
        centerTitle: true,
        backgroundColor: AppColor.deepGreen,
      ),
    );
  }
}