import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:capstone/models/post.dart';

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
          content:data['content']);
    }).toList());
  }
////////////게시물 삭제///////////////
  Future<void> addPost(Post post) async {
    await FirebaseFirestore.instance.collection('posts').add(post.toJson());
    posts.add(post);
    var docRef = await FirebaseFirestore.instance.collection('posts').add(post.toJson());
    post.id = docRef.id;
    posts.add(post);
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
// ///////////////게시물 수정////////////////
//   Future<void> updatePost(Post post) async {
//     // 사용자 UID 가져오기 (전에 작성한 getUserId 함수 사용)
//     String? userId = getUserId();
//
//     if (userId != null) {
//       await FirebaseFirestore.instance.collection('users').doc(userId).collection('posts').doc(post.id!).update(post.toJson());
//
//       // GetX 컨트롤러에서도 업데이트
//       int index = posts.indexWhere((existingPost) => existingPost.id == post.id);
//       if (index != -1) {
//         posts[index] = post;
//       }
//     }
//   }


