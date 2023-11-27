import 'dart:convert' as convert;
import 'package:capstone/evcar/ev.dart';
import 'package:http/http.dart' as http;

class EvRepository {
  Future<List<Ev>?> loadEvs() async {
    try {
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
}
