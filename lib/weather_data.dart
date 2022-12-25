import 'dart:convert';
import 'dart:io';

import 'package:framework/weather_model.dart';

import 'http_service.dart';

class WeatherData {
  Future<WeatherModel?> getWord(String city) async {
    var result;
    try {
      final response = await HttpService().getWeatherData(city);
      if (response.statusCode == 200) {
        final decodedResult = json.decode(response.body);

        result = WeatherModel.fromJson(decodedResult['main']);

        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpService catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
