import 'dart:convert' as convert;
import 'package:capstone/evcar/ev.dart';
import 'package:http/http.dart' as http;

class EvRepository {

  Future<List<Ev>?> loadEvs() async {
    try {
     // var apiKey = BuildConfig.SERVICE_KEY;
      String baseUrl =
          'https://api.odcloud.kr/api/EvInfoServiceV2/v1/getEvSearchList?page=1&perPage=314&cond%5Baddr%3A%3ALIKE%5D=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&serviceKey=E0cJ%2FE6%2FCk29xinL%2B61P0rG02Zd%2FldYsWCvs97sRPQJVGGsTxDLjo%2B1iw5C3dLwVgzmDWqm76VHhPiFS9hXWkg%3D%3D';
      final response = await http.get(Uri.parse(baseUrl));

      // 정상적으로 데이터를 불러왔다면
      if (response.statusCode == 200) {
        // JSON 데이터를 직접 파싱
        final jsonData = convert.json.decode(response.body);
        final jsonResponse = jsonData['data'];

        if (jsonResponse != null) {
          final List<dynamic> items = jsonResponse;

          if (items.isNotEmpty) {
            return items.map<Ev>((item) => Ev.fromJson(item)).toList();
          }
        }
      }
      throw Exception('Invalid API response format');
    } catch (e) {
      print('Exception during API request: $e');
      throw Exception('Failed to load ev list: $e');
    }
  }

  String getChargeStatusText(String cpStat) {
    switch (cpStat) {
      case "1":
        return "충전기 상태: 충전 가능";
      case "2":
        return "충전기 상태: 충전 중";
      case "3":
        return "충전기 상태: 고장/정검";
      case "4":
        return "충전기 상태: 통신장애";
      case "5":
        return "충전기 상태: 통신미연결";
      default:
        return "알 수 없는 상태";
    }
  }

  String getChargeTypeText(String cpTp) {
    switch (cpTp) {
      case "1":
        return "충전 방식: B타입(5핀)";
      case "2":
        return "충전 방식: C타입(5핀)";
      case "3":
        return "충전 방식: BC타입(5핀)";
      case "4":
        return "충전 방식: BC타입(5핀)";
      case "5":
        return "충전 방식: DC차데모";
      case "6":
        return "충전 방식: AC3상";
      case "7":
        return "충전 방식: DC콤보";
      case "8":
        return "충전 방식: DC차데모+DC콤보";
      case "9":
        return "충전 방식: DC차데모+AC3상";
      case "10":
        return "충전 방식: DC차데모+DC콤보+AC3상";
      default:
        return "알 수 없는 충전 방식";
    }
  }

  List<Ev> findEvsWithContentId(List<dynamic> evs, String cpId) {
    String cpIdString = cpId.toString();
    var filteredList = filterListByContentId(evs, cpIdString);
    //print('Original List: $evs');
    //print('Filtered List: $filteredList');
    return filteredList.map<Ev>((item) => Ev.fromJson(item)).toList();
  }

  List<dynamic> filterListByContentId(List<dynamic> list, String cpId) {
    var filteredList = list.where((item) => item['cpId'] == int.parse(cpId)).toList();
    //print('Filtering with cpId: $cpId');
    //print('Filtered List: $filteredList');
    return filteredList;
  }


  Future<List<Ev?>> getEvDetails(String cpId) async {
    try {
      String baseUrl =
          'https://api.odcloud.kr/api/EvInfoServiceV2/v1/getEvSearchList?page=1&perPage=314&cond%5Baddr%3A%3ALIKE%5D=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&serviceKey=E0cJ%2FE6%2FCk29xinL%2B61P0rG02Zd%2FldYsWCvs97sRPQJVGGsTxDLjo%2B1iw5C3dLwVgzmDWqm76VHhPiFS9hXWkg%3D%3D';
      final response = await http.get(Uri.parse(baseUrl));
      //print('API 응답: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = convert.json.decode(response.body);

        if (jsonData != null && jsonData['data'] != null) {
          var jsonResponse = jsonData['data'];

          if (jsonResponse is List) {
            //print('Calling findEvsWithContentId with cpId: $cpId');
            List<Ev> filteredEvs = findEvsWithContentId(jsonResponse, cpId);
            //print('Filtered Evs: $filteredEvs');
            return filteredEvs;
          } else if (jsonResponse is Map) {
            //print('Calling findEvsWithContentId with csId: $cpId');
            List<Ev> filteredEvs = findEvsWithContentId([jsonResponse], cpId);
            //print('Filtered Evs: $filteredEvs');
            return filteredEvs;
          }
        }
      }
      // API 응답이 올바르지 않을 때 응답 내용 출력
      throw Exception('Invalid API response format');
    } catch (e) {
      print('API 요청 중 예외 발생: $e');
      throw Exception('전기차 충전소 세부 정보를 불러오지 못했습니다.: $e');
    }
  }
}
