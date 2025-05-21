import 'dart:convert';
import 'package:http/http.dart' as http;

// Setting up constants
const String weatherApiKey = '7dbebccb6f40f95af5371598b08ceeea';
const String currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

// Method to get weather data for a specific city
Future<dynamic> getWeatherForCity({required String city}) async {
  final url = Uri.parse('$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey');

  try {

    final response = await http.get(url);

    if (response.statusCode != 200) {

      throw Exception('There was a problem with the request: status code: ${response.statusCode}');

    }

    else {

      return json.decode(response.body);

    }

  }
  catch (e) {

    throw Exception('There was a problem with the request: $e');

  }
}