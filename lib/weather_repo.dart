import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=e936dfa691613322da451c736aee56b5'));

    if (result.statusCode != 200) throw Exception('Falied to Load Weather');
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);
  }
}
