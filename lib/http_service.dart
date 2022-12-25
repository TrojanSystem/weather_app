import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> getWeatherData(String city) async {
    http.Response response;
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=79a2bc6c27bdcba37c3897e6d71d7675";
    final uri = Uri.parse(url);
    try {
      response = await http.get(uri);
    } on Exception catch (e) {
      throw e;
    }
    return response;
  }
}
