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

}
