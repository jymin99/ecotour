import 'package:drift/drift.dart';

class Schedules extends Table{
  IntColumn get id => integer().autoIncrement()(); // primary key
  TextColumn get content => text()(); // 내용, 글자열
  DateTimeColumn get date => dateTime()(); //날짜
  IntColumn get startTime => integer()(); //시작시간
  IntColumn get endTime => integer()(); //종료시간
}