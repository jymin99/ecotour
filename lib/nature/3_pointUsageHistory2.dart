import 'package:flutter/material.dart';

class PointUsageHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _PointUsageHistory();
  }
}

class _PointUsageHistory extends State<PointUsageHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            child: Image.network(
              'https://i.ibb.co/VSK4F6J/5.png', // Replace with your image URL
              width: 410, // Set the width of the image
              height: 480, // Set the height of the image
              fit: BoxFit.cover, // Adjust the BoxFit property as needed
            ),
          ),
          // Other widgets can be added here
        ],
      ),
    );
  }
}