import 'dart:convert';
import 'package:weather_console_app/config.dart';
import 'package:weather_console_app/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  Future<Wheather> getCurrentWeather(String cityName) async {
    final url =
        '${Config().baseUrl}/${Config().currentUrl}?key=${Config().apiKey}&q=$cityName';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status ${response.statusCode}');
      throw WeatherApiException('Error getting weather for $cityName');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (jsonResponse.isEmpty) {
      print('Weather data for $cityName not found');
    }

    return Wheather.fromJson(jsonResponse);
  }

  Future<List<Forecast>> getWeeklyForecast(String cityName) async {
    final url =
        '${Config().baseUrl}/${Config().forecastUrl}?key=${Config().apiKey}&q=$cityName&days=7';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status ${response.statusCode}');
      throw WeatherApiException('Error getting forecast for $cityName');
    }

    final jsonResponse = jsonDecode(response.body);
    final forecastList = List<Map<String, dynamic>>.from(jsonResponse['forecast']['forecastday']);

    if (jsonResponse.isEmpty) {
      print('Forecast data for $cityName not found');
    }

    return forecastList
        .map((forecastData) => Forecast.fromJson(forecastData))
        .toList();
  }
}

class WeatherApiException implements Exception {
  final String message;

  const WeatherApiException(this.message);
}
