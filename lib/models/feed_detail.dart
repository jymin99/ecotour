// class FeedDetail{
//   late int? id;
//   late String title;
//   late String content;
//   late String date;
//   late DocumentReference? reference;
//
//   FeedDetail({
//    this.id
//    required this.title,
//    required this.content,
//    required this.date,
//    this.reference,
// });
// }
//
// Map<String,dynamic>toMap(){
//   return{
//     'id':id,
//     'title':title,
//     'content':content,
//     'date':date,
//   }
// }
//
// FeedDetail.fromMap(Map<dynamic,dynamic>? map){
//   id=map?['id'];
//   title=map?['title']
//   content=map?['content'];
//   date=map?['date'];
// }
//
// FeedDetail.fromSnapshot(DocumentSnapshot document){
//   Map<String,dynamic>map=document.data() as Map<String,dynamic>;
//   id=map['id'];
//   title=map['title'];
//   content=map['content'];
//   date=map['date'];
//   reference=document.reference
// }