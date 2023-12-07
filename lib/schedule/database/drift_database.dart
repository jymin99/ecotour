// drift_database.dart

import 'dart:ffi';

import 'package:capstone/schedule/model/schedule.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';


part 'drift_database.g.dart'; // part 파일 지정
//private 값들도 사용 가능.

@DriftDatabase( // 사용할 테이블
  tables: [
    Schedules,
    Favorites,
  ],
)


class LocalDatabase extends _$LocalDatabase{
  LocalDatabase():super(_openConnection());

  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      //데이터 조회 및 변화 감지
      (select(schedules)..where((tbl)=>tbl.date.equals(date))).watch();

  // 추가: schedule 리스트의 모든 날짜를 가져오는 메서드
  Stream<List<DateTime>> getAllScheduleDates() =>
      (select(schedules)).watch().map((schedules) {
        // schedules에서 날짜만 추출하여 리스트로 반환
        return schedules.map((schedule) => DateTime(
            schedule.date.year, schedule.date.month, schedule.date.day)).toList();
      });

  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl)=>tbl.id.equals(id))).go();

  // 추가: 모든 schedule.id를 삭제하는 메서드
  Future<void> deleteAllScheduleIds() async {
    await (delete(schedules)).go();
  }

  // favorite 저장,삭제,보기
  Stream<List<String>> watchFavorites() =>
      (select(favorites)).watch().map((favorites) {
        return favorites.map((favorite) => favorite.favorites).toList();
      });

  Future<int> addFavorite(String favorite) =>
      into(favorites).insert(FavoritesCompanion(favorites: Value(favorite)));

  Future<int> removeFavorite(String favorite) =>
      (delete(favorites)..where((tbl) => tbl.favorites.equals(favorite))).go();

  Future<List<String>> getFavoritesList() async {
    final favoritesList =
    await (select(favorites)).get().then((favorites) {
      return favorites.map((favorite) => favorite.favorites).toList();
    });

    return favoritesList;
  }

  Future<int> updateFavorites(List<String> updatedFavorites) async {
    // 데이터베이스에 저장된 모든 favorites 삭제
    await (delete(favorites)).go();

    // 업데이트된 favorites 리스트를 데이터베이스에 추가
    for (var favorite in updatedFavorites) {
      await addFavorite(favorite);
    }

    return 1; // 무엇이든 상관 없는 값을 반환합니다.
  }

  Future<void> deleteAllFavorites() async {
    await (delete(favorites)).go();
  }

  @override
  int get schemaVersion => 3;
  //1부터 시작. 테이블 변화가 있을 시 1씩 올려줘서 구조 변경사항 인지시킴.

}

LazyDatabase _openConnection(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
//코드 생성 클래스
