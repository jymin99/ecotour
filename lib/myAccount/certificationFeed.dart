
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:capstone/style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FeedData {
  final String title;
  final String imagePath; // Store the image file path
  final String content;

  FeedData(this.title, this.imagePath, this.content);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imagePath': imagePath,
      'content': content,
    };
  }

  factory FeedData.fromJson(Map<String, dynamic> json) {
    return FeedData(
      json['title'] as String,
      json['imagePath'] as String,
      json['content'] as String,
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: FeedPage(),
  ));
}


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedData> feedList = [];

  @override
  void initState() {
    super.initState();
    _loadFeedData();
  }
  void _removeFeedFromList(FeedData feedData) {
    setState(() {
      feedList.remove(feedData);
      _saveFeedData(); // Make sure to save the updated list after removal
    });
  }
  ////창 닫히게 수정////
  void _deleteAndNavigate() {
    _saveFeedData(); // Save the updated feed list
    Navigator.pop(context); // Close FeedDetailPage
  }



  _loadFeedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFeedData = prefs.getString('feedData');
    if (savedFeedData != null) {
      // Decode the JSON string into a list of maps
      List<dynamic> decoded = jsonDecode(savedFeedData);

      // Convert each map into a FeedData object
      List<FeedData> loadedFeedList = List<FeedData>.from(decoded.map((json) => FeedData.fromJson(json)));

      setState(() {
        feedList = loadedFeedList;
      });
    }
  }

  _saveFeedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert feedList to a list of JSON objects
    List<Map<String, dynamic>> feedListJson =
    feedList.map((feed) => feed.toJson()).toList();
    // Encode the list of JSON objects to a string
    String feedListString = jsonEncode(feedListJson);

    prefs.setString('feedData', feedListString);
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
              _saveFeedData();
            });
          }
        },
        backgroundColor: AppColor.deepGreen,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 행에 3개의 열로 배열
          crossAxisSpacing: 8.0, // 열 간격
          mainAxisSpacing: 8.0, // 행 간격
        ),
        itemCount: feedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showFeedDetail(context, feedList[index]);
            },
            child: Container(
              decoration: BoxDecoration(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(
                  File(feedList[index].imagePath), // Use the file path to load the image
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

///창 닫히게 수정
  void _showFeedDetail(BuildContext context, FeedData feedData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedDetailPage(
          feedData: feedData,
          onDelete: _removeFeedFromList,
          onNavigate: () => _deleteAndNavigate(),  // Pass the callback
        ),
      ),
    );
  }
}

class FeedDetailPage extends StatelessWidget {
  final FeedData feedData;
  final Function(FeedData) onDelete;
  final VoidCallback onNavigate; // Add onNavigate callback


  const FeedDetailPage({Key? key, required this.feedData, required this.onDelete,required this.onNavigate,}) : super(key: key);


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
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.deepGreen,
        title: Text(
          feedData.title,
          style: const TextStyle(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.file(
                  File(feedData.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(feedData.content),
            )
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Feed"),
          content: const Text("Are you sure you want to delete this feed?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteAndNavigate();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }


  void _deleteAndNavigate() {
    onDelete(feedData);
    onNavigate();
  }
}


class FeedUpload extends StatefulWidget {
  const FeedUpload({Key? key}) : super(key: key);

  @override
  State<FeedUpload> createState() => _FeedUploadState();
}

class _FeedUploadState extends State<FeedUpload> {
  File? _image;
  String? _imagePath; // Declare imagePath here
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
  Future<String> _saveImageToDirectory() async {
    if (_image == null) {
      return ''; // No image to save
    }

    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String imagePath = '${appDocumentsDirectory.path}/feed_image_${DateTime.now().millisecondsSinceEpoch}.png';

    await _image!.copy(imagePath);

    return imagePath;
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
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: AppColor.deepGreen),
                    hintText: 'Enter a title',
                    hintStyle: TextStyle(color: AppColor.deepGreen),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.deepGreen), // 활성 상태의 테두리 색상 지정
                    ),// hintText 색상 지정// labelText 색상 지정
                  ),

                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.deepGreen),
                  ),
                  onPressed: _getImage,
                  child: const Text('Pick Image',style: TextStyle(color: Colors.white),),
                ),

                const SizedBox(height: 5),
                _image != null
                    ? Image.file(
                  _image!,
                  height: 150,
                )
                    : Container(),
                const SizedBox(height: 16),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: const TextStyle(color: AppColor.deepGreen),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColor.deepGreen,width: 10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColor.deepGreen, width: 2.0), // 초점이 맞춰진 상태에서의 테두리 스타일 설정
                    ),
                  ),
                  maxLines: null,
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async{
                      _imagePath = await _saveImageToDirectory();
                      if (_image != null &&
                          _titleController.text.isNotEmpty &&
                          _contentController.text.isNotEmpty &&
                          _imagePath != null) {
                        FeedData newFeed = FeedData(
                          _titleController.text,
                          _imagePath!,
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
                      minimumSize: MaterialStateProperty.all<Size>(const Size(200, 40)),
                    ),
                    child: const Text(
                      'Upload Feed',
                      style: TextStyle(fontSize: 15.0,color: Colors.white),
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
