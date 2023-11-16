import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capstone/models/post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController{
  var posts=<Post>[].obs;

  @override
  void onInit(){
    super.onInit();
    loadPosts();
  }
//////////게시물 로드/////////////
  Future<void> loadPosts() async{
    var postDocs=await FirebaseFirestore.instance.collection('posts').get();
    posts.assignAll(postDocs.docs.map((doc){
      var data=doc.data() as Map<String,dynamic>;
      return Post(
          id:doc.id,title:data['title'],
          imageUrl:data['image'],likes: data['like']);
    }).toList());
  }
////////////게시물 upload///////////////
  Future<void> uploadImage(imagePath) async{
    try {
      final ImagePicker _imagePicker=ImagePicker();
      final XFile? image =await _imagePicker.pickImage(source:ImageSource.gallery);

      if (image!=null){
        Reference storageReference=FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
        UploadTask uploadTask=storageReference.putFile(File(imagePath));
        await uploadTask.whenComplete(()async{
          String imageUrl=await storageReference.getDownloadURL();
          FirebaseFirestore.instance.collection('posts').add({
            'imageUrl':imageUrl,
            'likes':0,
          });
        });
      }
    }
    catch(e){
      print('Error uploading image and creating post:$e');
    }
  }
//////////게시물 삭제//////////////
  Future<void> deletePost(String postId) async {
    // 사용자 UID 가져오기 (전에 작성한 getUserId 함수 사용)
    // String? userId = getUserId();

    // if (userId != null) {
    //   await FirebaseFirestore.instance.collection('users').doc(userId).collection('posts').doc(postId).delete();

      // GetX 컨트롤러에서도 삭제
      posts.removeWhere((post) => post.id == postId);
    }
  }

