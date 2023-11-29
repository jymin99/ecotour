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

  List<Accommodation> findAccommodationsWithContentId(List<dynamic> accommodations, String contentid) {
    return filterListByContentId(accommodations, contentid)
        .map<Accommodation>((item) => Accommodation.fromJson(item))
        .toList();
  }

  List<dynamic> filterListByContentId(List<dynamic> list, String contentid) {
    return list.where((item) => item['contentid'] == contentid).toList();
  }

  Future<List<Accommodation?>> getAccommodationDetails(String contentid) async {
    try {
      String baseUrl =
          "https://apis.data.go.kr/B551011/KorService1/searchStay1?numOfRows=339&pageNo=1&MobileOS=AND&MobileApp=capstone&areaCode=1&serviceKey=E0cJ%2FE6%2FCk29xinL%2B61P0rG02Zd%2FldYsWCvs97sRPQJVGGsTxDLjo%2B1iw5C3dLwVgzmDWqm76VHhPiFS9hXWkg%3D%3D";
      final response = await http.get(Uri.parse(baseUrl));

      // 요청이 성공했는지 확인
      if (response.statusCode == 200) {
        // 응답 본문을 파싱
        final body = convert.utf8.decode(response.bodyBytes);
        final xml = Xml2Json()..parse(body);
        final json = xml.toParker();

        // 필요한 데이터 추출
        Map<String, dynamic> jsonResult = convert.json.decode(json);
        if (jsonResult.containsKey('response')) {
          final jsonBody = jsonResult['response']['body'];
          if (jsonBody != null && jsonBody.containsKey('items')) {
            final jsonAcc = jsonBody['items']['item'];

            // 필요한 데이터가 있는지 확인
            if (jsonAcc != null) {
              List<dynamic> list = jsonAcc is List ? jsonAcc : [jsonAcc];

              // Filter accommodations based on contentid
              List<Accommodation> filteredAccommodations = findAccommodationsWithContentId(list, contentid);

              return filteredAccommodations;
            }
          }
        }

        throw Exception('잘못된 API 응답 형식');
      } else {
        throw Exception(
            '숙박 시설 세부 정보를 불러오지 못했습니다. 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('API 요청 중 예외 발생: $e');
      throw Exception('숙박 시설 세부 정보를 불러오지 못했습니다.: $e');
    }
  }
}
