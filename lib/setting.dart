import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final List<String> itemList = [ '로그아웃', '회원탈퇴', '친환경 여행 후원',];
  Setting({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(itemList[index]),
          onTap: () {
            // 리스트 아이템을 터치했을 때 해당 아이템의 이름을 전달하여 새로운 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailPage(itemName: itemList[index]),
              ),
            );
          },
        );
      },
    ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  final String itemName;

  // 생성자를 통해 itemName을 전달받습니다.
  ItemDetailPage({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$itemName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detail for $itemName', // 선택한 아이템의 이름을 표시
              style: TextStyle(fontSize: 24),
            ),
            // 여기에 해당 아이템의 추가 세부 정보를 표시하는 위젯을 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}