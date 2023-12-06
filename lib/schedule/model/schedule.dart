import 'package:drift/drift.dart';

class Schedules extends Table{
  IntColumn get id => integer().autoIncrement()(); // primary key
  TextColumn get memo => text()(); // 내용, 글자열
  TextColumn get title => text()(); // 내용, 글자열
  TextColumn get place => text()(); // 내용, 글자열
  DateTimeColumn get date => dateTime()(); //날짜
  IntColumn get startTimeH => integer()(); //시작 시
  IntColumn get startTimeM => integer()(); //시작 분
  IntColumn get endTimeH => integer()(); //종료 시
  IntColumn get endTimeM => integer()(); //종료 분
  TextColumn get imagePath => text()(); // 내용, 글자열
}