import 'dart:convert' as convert;
import 'package:capstone/cycle/cycle.dart';
import 'package:http/http.dart' as http;

class CycleRepository {
  var apiKey = "795545647a7368693539694e497270";


  Future<List<Cycle>?> loadCycles() async {
    try {
      String baseUrl = "http://openapi.seoul.go.kr:8088/$apiKey/json/tbCycleStationInfo/1/1000/";
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = convert.json.decode(response.body);

        if (jsonResponse.containsKey('stationInfo')) {
          final List<dynamic>? jsonCycle = jsonResponse['stationInfo']['row'];

          if (jsonCycle != null) {
            List<Cycle> cycles = jsonCycle.map<Cycle>((item) => Cycle.fromJson(item)).toList();
            return cycles;
          }
        } else {
          throw Exception('Invalid API response format');
        }
      } else {
        throw Exception('Failed to load bike stations. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during API request: $e');
      throw Exception('Failed to load bike stations: $e');
    }
  }


  List<Cycle> findCyclesWithContentId(List<Map<String, dynamic>> cycles, String rentId) {
    var filteredList = filterListByContentId(cycles, rentId);
    // print('Original List: $cycles');
    // print('Filtered List: $filteredList');
    return filteredList.map<Cycle>((item) => Cycle.fromJson(item)).toList();
  }

  List<Map<String, dynamic>> filterListByContentId(List<Map<String, dynamic>> list, String rentId) {
    var filteredList = list.where((item) => item['RENT_ID'] == rentId).toList();
    // print('rentId로 필터링 중: $rentId');
    // print('필터링된 목록: $filteredList');
    return filteredList;
  }

  Future<List<Cycle?>> getEvDetails(String rentId) async {
    try {
      String baseUrl = "http://openapi.seoul.go.kr:8088/$apiKey/json/tbCycleStationInfo/1/1000/";

      final response = await http.get(Uri.parse(baseUrl));
      // print('API 응답: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = convert.json.decode(response.body);

        if (jsonData != null && jsonData['stationInfo'] != null) {
          var jsonResponse = jsonData['stationInfo']['row'];

          if (jsonResponse is List) {
            // print('Calling findCyclesWithContentId with rentId: $rentId');

            if (rentId is String && rentId.isNotEmpty && rentId.startsWith('ST-')) {
              List<Map<String, dynamic>> typedJsonResponse = List<Map<String, dynamic>>.from(jsonResponse);
              List<Cycle> filteredCycles = findCyclesWithContentId(typedJsonResponse, rentId);
              // print('Filtered Cycles: $filteredCycles');
              return filteredCycles;
            } else {
              // print('Invalid rentId format: $rentId');
              throw Exception('Invalid rentId format: $rentId');
            }
          } else if (jsonResponse is Map) {
            // 'stationInfo'를 키로 하는 리스트가 아니라면 여기에 대한 추가적인 로직을 구현해야 할 수 있습니다.
            throw Exception('Invalid data format. Expected a list under "stationInfo" key.');
          }
        }
      }
      // API 응답이 올바르지 않을 때 응답 내용 출력
      throw Exception('Invalid API response format');
    } catch (e) {
      print('API 요청 중 예외 발생: $e');
      throw Exception('따릉이 세부 정보를 불러오지 못했습니다.: $e');
    }
  }


}
