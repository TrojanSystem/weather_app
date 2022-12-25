abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  String cityName;
  FetchWeather({required this.cityName});
}
class ResetWeather extends WeatherEvent {}