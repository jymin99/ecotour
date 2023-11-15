import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capstone/feed/post_controller.dart';
import 'package:capstone/models/post.dart';

class CertificationFeed extends StatelessWidget {
  final PostController postController=Get.put(PostController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 피드 작성 폼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: '제목'),
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: '내용'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 피드 추가 버튼 클릭 시
                    Post newPost = Post(
                      title: titleController.text,
                      content: contentController.text, id: '',
                    );
                    postController.addPost(newPost);
                    // 입력 필드 초기화
                    titleController.text = '';
                    contentController.text = '';
                  },
                  child: Text('피드 추가'),
                ),
              ],
            ),
          ),
          // 피드 목록
          Expanded(
            child: Obx(() {
              if (postController.posts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: postController.posts.length,
                itemBuilder: (context, index) {
                  var post = postController.posts[index];
                  return ListTile(
                    title: Text(post.title ?? ""),
                    subtitle: Text(post.content ?? ""),
                    trailing: Row(
                      mainAxisSize:MainAxisSize.min,
                      children: [
                        // IconButton(
                        //   icon:Icon(Icons.edit),
                        //   onPressed: (){
                        //     postController.updatePost(updatedPost);
                        //   },
                        // ),
                        IconButton(
                            onPressed: (){
                              postController.deletePost(post.id!);
                            },
                            icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
