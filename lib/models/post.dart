import 'package:cloud_firestore/cloud_firestore.dart';

class Feed{
  final String id;//게시물의 id 나중에 firebase 연동
  final String title;
  final String link;
  final int likeCount;

  Feed({
    required this.id,
    required this.title,
    required this.link,
    required this.likeCount,
});
}