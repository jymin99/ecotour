// accountInfo.dart

import 'package:capstone/login.dart';
import 'package:flutter/material.dart';
import 'package:capstone/style.dart';
import 'package:get/get.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.deepGreen,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            '계정 정보',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: AccountDetail(),
    );
  }
}


class AccountDetail extends StatefulWidget {
  const AccountDetail({super.key});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}
class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '계정 정보',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GetBuilder<AuthService>(
              builder: (authController) {
                // 사용자가 로그인하지 않았을 때
                if (authController.user.value == null) {
                  return Text(
                    '로그인되지 않았습니다.',
                    style: TextStyle(fontSize: 16),
                  );
                }

                // 사용자가 익명 로그인한 경우
                if (authController.user.value!.isAnonymous) {
                  return Text(
                    '계정: 익명 로그인',
                    style: TextStyle(fontSize: 16),
                  );
                }

                // 사용자가 Google 로그인한 경우
                if (authController.user.value!.providerData[0].providerId == 'google.com') {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(authController.user.value!.photoURL ?? ''),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '계정: Google 로그인',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '이름: ${authController.user.value!.displayName}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '이메일: ${authController.user.value!.email}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                }

                // 다른 로그인 방식에 대한 처리 추가 가능

                return Container(); // 기타 경우에는 빈 컨테이너 반환
              },
            ),
          ],
        ),
      ),
    );
  }
}
