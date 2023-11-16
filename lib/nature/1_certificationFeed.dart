import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';


class CertificationFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certification Feed',
      home: UploadFeed(),
    );
  }
}

class UploadFeed extends StatefulWidget {
  const UploadFeed({super.key});

  @override
  State<UploadFeed> createState() => _UploadFeedState();
}

class _UploadFeedState extends State<UploadFeed> {
  final TextEditingController _titleController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? _selectedImages;

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '게시물 제목',border: OutlineInputBorder(),),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              // 갤러리에서 이미지 선택
              pickImages();
            },
            child: Text('이미지 선택'),
          ),
          if (_selectedImages != null)
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedImages!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(File(_selectedImages![index].path)),
                  );
                },
              ),
            ),
          ElevatedButton(
            onPressed: () {
              // 게시물 업로드 함수 호출
              uploadPost();
            },
            child: Text('게시물 올리기'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var posts = snapshot.data?.docs;

                return ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    var post = posts?[index];
                    return ListTile(
                      title: Text(post?['title']),
                      trailing: IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {
                          likePost(post!.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> pickImages() async {
    try {
      final result = await _imagePicker.pickMultiImage(
        imageQuality: 70,
      );
      setState(() {
        _selectedImages = result;
      });
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  void uploadPost() async {
    String title = _titleController.text;

    if (title.isNotEmpty && _selectedImages != null) {
      for (var image in _selectedImages!) {
        // 이미지 업로드
        var imageUrl = await uploadImage(File(image.path));
        // 게시물 업로드
        if (imageUrl != null) {
          FirebaseFirestore.instance.collection('posts').add({
            'title': title,
            'imageUrl': imageUrl,
            'likes': 0,
          });
        }
      }

      // 업로드 후 입력 필드 및 선택 이미지 초기화
      _titleController.clear();
      setState(() {
        _selectedImages = null;
      });
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      // TODO: 이미지를 Firebase Storage에 업로드하고 URL을 반환하는 코드 추가
      final firebase_storage.Reference storageRef =
      firebase_storage.FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.png');

      await storageRef.putFile(image);

      final String downloadURL = await storageRef.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  void likePost(String postId) {
    FirebaseFirestore.instance.collection('posts').doc(postId).update({
      'likes': FieldValue.increment(1),
    });
  }
}
