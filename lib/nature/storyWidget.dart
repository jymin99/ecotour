import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:capstone/style.dart';

Widget buildStoryContainer(BuildContext context, String assetPath, String title, String subtitle) {
  return SingleChildScrollView(
    child: Column(
      children: [
        InkWell(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => StoryModal(assetPath: assetPath, title: title, subtitle: subtitle),
            );
          },
          child: Container(
            width: 390,
            height: 120,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  assetPath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    ),
  );
}

class StoryModal extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;

  const StoryModal({Key? key, required this.assetPath, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),
        Container(
          height: 580,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10),
                Image.network(
                  assetPath,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.lightYellowGreen,
                    minimumSize: Size(350, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('닫기', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
