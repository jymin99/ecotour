import 'dart:convert' as convert;
import 'package:capstone/evcar/ev.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EvRepository {
  // api key
  var apiKey =
      "E0cJ%2FE6%2FCk29xinL%2B61P0rG02Zd%2FldYsWCvs97sRPQJVGGsTxDLjo%2B1iw5C3dLwVgzmDWqm76VHhPiFS9hXWkg%3D%3D";

  Future<List<Ev>?> loadEvs() async {
    var addr = "서울";
    String baseUrl =
        "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?addr=$addr&pageNo=1&numOfRows=10&ServiceKey=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));

    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {
      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);
      print('Response Body: $body');

      // xml => json으로 변환
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();
      print('Converted JSON: $json');

      // 필요한 데이터 찾기
      Map<String, dynamic>? jsonResult = convert.json.decode(json);
      final jsonResponse = jsonResult?['response'];

// body가 null이거나 items가 null이면 처리하지 않고 종료
      if (jsonResponse == null || jsonResponse['body'] == null) {
        // 예외 처리 또는 적절한 동작을 수행
        print('Error loading ev list: Invalid JSON structure');
        return null; // 또는 빈 리스트 등을 반환하여 계속 진행하도록 할 수 있음
      }

      final jsonBody = jsonResponse['body'];
      if (jsonBody != null && jsonBody['items'] != null) {
        final items = jsonBody['items']['item'];

        // 필요한 데이터 그룹이 있다면
        if (items != null) {
          // map을 통해 데이터를 전달하기 위해 객체인 List로 만든다.
          List<dynamic> list = items is List ? items : [items];

          // map을 통해 Ev형태로 item을 => Ev.fromJson으로 전달
          return list.map<Ev>((item) => Ev.fromJson(item)).toList();
        }
      }


      // API 요청이 실패하거나 데이터가 없을 경우에는 null이나 빈 리스트 등을 반환
    return null;
  }

}