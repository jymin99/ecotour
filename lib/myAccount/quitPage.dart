import 'package:flutter/material.dart';
import 'package:capstone/style.dart';

class QuitPage extends StatelessWidget {
  const QuitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.deepGreen,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            '회원탈퇴',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: AppColor.deepGreen,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: const QuitPageDetail(),
    );
  }
}


class QuitPageDetail extends StatefulWidget {
  const QuitPageDetail({super.key});

  @override
  State<QuitPageDetail> createState() => _QuitPageDetailState();
}

class _QuitPageDetailState extends State<QuitPageDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
