import 'package:flutter/material.dart';
import 'package:capstone/style.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

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
            '로그아웃',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: AppColor.deepGreen,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: LogoutDetail(),
    );
  }
}


class LogoutDetail extends StatefulWidget {
  const LogoutDetail({super.key});

  @override
  State<LogoutDetail> createState() => _LogoutDetailState();
}

class _LogoutDetailState extends State<LogoutDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
