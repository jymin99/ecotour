class Post {
  String? id;
  String? title;
  String? content;

  Post(
      {required this.id,
        required this.title,
        required this.content,});

  Map<String, dynamic> toJson(){
    return{
      'title':title,
      'content':content,
    };
  }
}