import 'dart:convert' as convert;
import 'package:capstone/accommodation/accommodation.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class AccommodationRepository {
  Future<List<Accommodation>?> loadAccs() async {
    try {
      String baseUrl =
          "https://apis.data.go.kr/B551011/KorService1/searchStay1?numOfRows=339&pageNo=1&MobileOS=AND&MobileApp=capstone&areaCode=1&serviceKey=E0cJ%2FE6%2FCk29xinL%2B61P0rG02Zd%2FldYsWCvs97sRPQJVGGsTxDLjo%2B1iw5C3dLwVgzmDWqm76VHhPiFS9hXWkg%3D%3D";
      final response = await http.get(Uri.parse(baseUrl));

      // 정상적으로 데이터를 불러왔다면
      if (response.statusCode == 200) {
        // 데이터 가져오기
        final body = convert.utf8.decode(response.bodyBytes);

        // xml => json으로 변환
        final xml = Xml2Json()..parse(body);
        final json = xml.toParker();

        // Debug prints
        //print('Response Body: $body');
        //print('Converted JSON: $json');

        // 필요한 데이터 찾기
        Map<String, dynamic> jsonResult = convert.json.decode(json);
        if (jsonResult.containsKey('response')) {
          final jsonBody = jsonResult['response']['body'];
          if (jsonBody != null && jsonBody.containsKey('items')) {
            final jsonAcc = jsonBody['items']['item'];

            // 필요한 데이터 그룹이 있다면
            if (jsonAcc != null) {
              // item이 List 형태로 오는 경우 처리
              List<dynamic> list = jsonAcc is List ? jsonAcc : [jsonAcc];

              // map을 통해 데이터를 전달하기 위해 객체인 List로 만든다.
              return list
                  .map<Accommodation>((item) =>
                  Accommodation.fromJson(item))
                  .toList();
            }
          }
        }

        throw Exception('Invalid API response format');
      } else {
        throw Exception(
            'Failed to load accommodation list. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during API request: $e');
      throw Exception('Failed to load accommodation list.: $e');
    }
  }
}
