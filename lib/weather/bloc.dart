import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:framework/weather_data.dart';

import '../weather_model.dart';
import 'event.dart';
import 'state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        WeatherModel? weather = await weatherRepo.getWord(event.cityName);
        if (weather == null) {
          emit(WeatherIsNotLoaded(errorMessage: 'Weather Api Returned Null'));
        } else {

          emit(WeatherIsLoaded(fetchedWeather: weather));

        }
      } on Exception catch (e) {
        emit(WeatherIsNotLoaded(errorMessage: e.toString()));
      }
    });
    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearched());
    });
  }

  final cityController = TextEditingController();
  WeatherData weatherRepo;

// Stream<WeatherState> mapEventToState(
//     WeatherEvent event, context) async* {
//   if (event is FetchWeather) {
//     yield WeatherIsLoading();
//     try {
//       WeatherModel? weather =
//           await weatherRepo.getWord(event.cityName, context);
//       if (weather == null) {
//         yield WeatherIsNotLoaded(errorMessage: 'Error');
//       } else {
//         yield WeatherIsLoaded(fetchedWeather: weather);
//         yield WeatherIsNotSearched();
//       }
//     } on Exception catch (e) {
//       yield WeatherIsNotLoaded(errorMessage: e.toString());
//     }
//   } else if (event is ResetWeather) {
//     yield WeatherIsNotSearched();
//   }
// }
}
