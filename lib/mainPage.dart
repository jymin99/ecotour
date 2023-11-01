import 'package:flutter/material.dart';
import 'style.dart';
import 'package:capstone/3catagories/naturePage.dart';
import 'package:capstone/3catagories/mapPage.dart';
import 'package:capstone/3catagories/planPage.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}


class _MainPage extends State<MainPage> {
  int _selectedIndex = 1; // Index of the selected tab

  final List<Widget> _pages = [
    MapPage(),
    PlanPage(),
    NaturePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            '그린패스',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle, color: Colors.black),
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomAppBar(
          color: Colors.white, // 네비게이션 바의 배경색
          shape: CircularNotchedRectangle(), // 테두리를 둥글게 만듭니다.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Text(
                      '관광지도',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 0 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Text(
                      '환경스토어',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 2 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColor.lightGreen,
            onPressed: () {
              if (_selectedIndex == 1) {
                // 현재 페이지가 인덱스 1 (PlanPage)인 경우
                // 정보 입력 및 페이지 업데이트 동작 수행
                _showInputDialog(context); // 정보 입력 다이얼로그 표시

              } else {
                setState(() {
                  _selectedIndex = 1; // 현재 페이지가 인덱스 1이 아닐 때는 PlanPage로 이동
                });
              }
            },
            child: Column(
                children: [
                  Container(height: 17,),
                  Icon(Icons.edit_calendar, color: Colors.black, size: 23,),
                  // Container(height: 2,),
                  // Text(
                  //   "내 계획",
                  //   style: TextStyle(
                  //     // fontFamily: "Lotte",
                  //     fontSize: 8,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ]
            ),
          ),
        ),
      ),

    );
  }
}




void _showInputDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Information'),
        content: TextField(
          onChanged: (String value) {
            // 입력된 정보 처리
            // 페이지 업데이트 등을 수행
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // 다이얼로그 닫기
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
