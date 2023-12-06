import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:capstone/style.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:capstone/style.dart';


Widget buildDonationContainer(BuildContext context, String assetPath, String title, String subtitle, String url) {
  return SingleChildScrollView(
    child: Column(
      children: [
        InkWell(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => StoryModal(assetPath: assetPath, title: title, subtitle: subtitle, url: url,),
            );
          },
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width-20,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,  // 수평 스크롤을 위한 설정
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    assetPath,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 20),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    ),
  );
}

class StoryModal extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;
  final String url;

  const StoryModal({Key? key, required this.assetPath, required this.title, required this.subtitle, required this.url}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL을 열 수 없습니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Container(
          height: 1000,
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                Image.network(
                  assetPath,
                  width: 400,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _launchURL(url);
                  },
                  child: Text(
                    url,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColor.deepGreen,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.lightYellowGreen,
                    minimumSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('닫기', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}



