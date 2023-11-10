import 'package:firebase_database/firebase_database.dart';

class Feed {
  String? key;
  String title;
  String content;
  String createTime;

  Feed(this.title, this.content, this.createTime);

  Feed.fromSnapshot(DataSnapshot snapshot)
    :key=snapshot.key,
  title=snapshot.value['title'],
  content=snapshot.value['content'],
  createTime=snapshot.value['createTime'];

  toJson(){
    return{
      'title':title,
      'content':content,
      'creatTime':createTime,
    };
  }
}