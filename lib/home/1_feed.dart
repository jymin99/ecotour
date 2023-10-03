import 'package:flutter/material.dart';
import 'package:capstone/cards/postcard.dart';
import 'package:get/get.dart';
import 'package:capstone/cards/detailpage.dart';

import '../cards/writepage.dart';
import '../style.dart';

class Feed extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Feed();
  }
}

class _Feed extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(WritePage());
        },
        child:Icon(Icons.add,),
        backgroundColor: AppColor.newGreen,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index));
                // child: Row(
                //   children: <Widget>[
                //     Image.asset(
                //         'assets/beach.jpg',
                //         height: 200.0,
                //         width: 100.0,
                //         ),
                //     Padding(padding: EdgeInsets.only(top: 10.0)),
                //     Text('data')
                //   ],
                // )

              },
              title: Text("제목"),
            );
            }, separatorBuilder: (BuildContext context, int index) {
            return Divider();
      },
      ),
      ),
    );
  }

  // Widget postContainer() {
  //   return Column(
  //     children: [
  //       Padding(padding: EdgeInsets.only(bottom: 10.0)),
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 100,
  //         color: Colors.white,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             'data',
  //             style: TextStyle(
  //               fontSize: 20.0,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}