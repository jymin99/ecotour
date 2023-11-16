class Post {
  String? id;
  String? title;
  String? imageUrl;
  int likes;

  Post(
      {required this.id,
        required this.title,
        required this.imageUrl,
        required this.likes});

  Map<String, dynamic> toJson(){
    return{
      'title':title,
      'image':imageUrl,
      'like':likes,
    };
  }
}