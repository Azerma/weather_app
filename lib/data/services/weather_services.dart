import 'dart:convert';
import 'package:quiz/data/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/data/models/weather_response.dart';

class WeatherServices {
  static Future<WeatherResponse> getWeatherInfo(String city) async {
    try {
      final endpoint = Endpoints.weatherUrl(city);
      Uri url = Uri.parse(endpoint);
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(data);
      }
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }
}
