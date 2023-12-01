import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:capstone/models/post.dart';
import 'package:capstone/style.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

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
            '인증 피드',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: AppColor.deepGreen,
          ),
        ),
      centerTitle: true,
        ),
      ),
      body: CertificationFeed(),
    );
  }
}



final List<Feed> feeds=[
  Feed(
    id: "0",
    title:"test",
    link:"assets/images/",
    likeCount:0,
  ),
  Feed(
    id: "1",
    title:"test",
    link:"assets/images/",
    likeCount:0,
  )
];

class CertificationFeed extends StatefulWidget {
  const CertificationFeed({super.key});

  @override
  State<CertificationFeed> createState() => _CertificationFeedState();
}

class _CertificationFeedState extends State<CertificationFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: (){
          showDialog(
              context: context,
              builder: (_)=>const ImageUpload(),
          );
        },
        backgroundColor: AppColor.deepGreen,
        child: Icon(Icons.add),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top:10.0,
          left: 10.0,
          right: 10.0,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,
          mainAxisSpacing:10,
          crossAxisSpacing:10,
          childAspectRatio:1,
        ),
        itemCount: feeds.length,
        itemBuilder: (_,int index)=>GestureDetector(
          //상세화면으로 이동
        onTap:(){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=>FeedDetail(
                feed:feeds[index],
              ),
            ),
          );
        },
      child: Image.asset(
        feeds[index].link,
        fit:BoxFit.cover,
      ),
      ),
      ),

    );
  }
}

class FeedDetail extends StatefulWidget {
  const FeedDetail({super.key,required this.feed,});
  final Feed feed;

  @override
  State<FeedDetail> createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          physics: const ClampingScrollPhysics(),
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                widget.feed.link,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isLiked?Icons.thumb_up:Icons.thumb_up_outlined,
                  ),
                  onPressed: (){
                    setState(() {
                      isLiked=!isLiked;
                    });
                  },
                ),
                Text(
                  widget.feed.likeCount.toString(),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}



class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  String? imagePath;

  Future<String?>selectImage() async{
    final picker=ImagePicker();
    XFile? pickImage=await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickImage==null) return null;
    return pickImage.path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(
        top:100
      ),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('인증피드 업로드', textAlign: TextAlign.center,),
            backgroundColor: AppColor.deepGreen,
            leading: IconButton(
              icon: const Text('취소'),
              padding: EdgeInsets.zero,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Text('저장'),
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          body:Container(
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap:(){
                    selectImage().then((String? path){
                      if(path==null) return;
                      setState(() {
                        imagePath=path;
                      });
                });
                },
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            width: 0.5,
                            color: const Color(0xFFAAAAAA),
                          ),
                        ),
                        child: imagePath!=null
                          ? Image.file(File(imagePath!),
                        width: 200,height: 200)
                            :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload,
                              size: 50,
                            ),
                            Text('인증피드 업로드')
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

