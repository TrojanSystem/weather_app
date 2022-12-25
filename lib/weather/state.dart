import '../weather_model.dart';

abstract class WeatherState {}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  WeatherModel fetchedWeather;

  WeatherIsLoaded({required this.fetchedWeather});
}

class WeatherIsNotLoaded extends WeatherState {
  String errorMessage;

  WeatherIsNotLoaded({required this.errorMessage});
}
