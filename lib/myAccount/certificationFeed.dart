import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:capstone/style.dart';

void main() {
  runApp(MaterialApp(
    home: FeedPage(),
  ));
}

class FeedData {
  final String title;
  final File image;
  final String content;

  FeedData(this.title, this.image, this.content);
}

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedData> feedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.deepGreen,
        title: const Text(
          "나의 기여",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'lotte',
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FeedUpload()),
          );

          if (result != null && result is FeedData) {
            setState(() {
              feedList.add(result);
            });
          }
        },
        backgroundColor: AppColor.deepGreen,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: feedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showFeedDetail(context, feedList[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.file(
                      feedList[index].image,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedList[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFeedDetail(BuildContext context, FeedData feedData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedDetailPage(feedData: feedData),
      ),
    );
  }
}

class FeedDetailPage extends StatelessWidget {
  final FeedData feedData;

  const FeedDetailPage({Key? key, required this.feedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.deepGreen,
        title: Text(
          feedData.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'lotte',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(feedData.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(feedData.content),
            )
          ],
        ),
      ),
    );
  }
}

class FeedUpload extends StatefulWidget {
  const FeedUpload({Key? key}) : super(key: key);

  @override
  State<FeedUpload> createState() => _FeedUploadState();
}

class _FeedUploadState extends State<FeedUpload> {
  File? _image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.deepGreen,
        title: const Text(
          "기록 올리기",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'lotte',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: AppColor.deepGreen),
                    hintText: 'Enter a title',
                    hintStyle: TextStyle(color: AppColor.deepGreen),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.deepGreen), // 활성 상태의 테두리 색상 지정
                    ),// hintText 색상 지정// labelText 색상 지정
                  ),

                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.deepGreen),
                  ),
                  onPressed: _getImage,
                  child: Text('Pick Image'),
                ),

                SizedBox(height: 16),
                _image != null
                    ? Image.file(
                  _image!,
                  height: 150,
                )
                    : Container(),
                SizedBox(height: 16),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(color: AppColor.deepGreen),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColor.deepGreen,width: 10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColor.deepGreen, width: 2.0), // 초점이 맞춰진 상태에서의 테두리 스타일 설정
                    ),
                  ),
                  maxLines: null,
                ),
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_image != null &&
                          _titleController.text.isNotEmpty &&
                          _contentController.text.isNotEmpty) {
                        FeedData newFeed = FeedData(
                          _titleController.text,
                          _image!,
                          _contentController.text,
                        );
                        Navigator.pop(context, newFeed);
                      } else {
                        // Handle case when image, title, or content is not provided
                        print('Please fill in all fields.');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColor.deepGreen),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                    ),
                    child: const Text(
                      'Upload Feed',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
