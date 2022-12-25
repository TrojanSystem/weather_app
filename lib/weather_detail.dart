import 'package:flutter/material.dart';
import 'package:framework/weather_model.dart';

class WeatherDetail extends StatelessWidget {
   WeatherDetail({super.key, required this.cityName});
  WeatherModel  cityName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(cityName.feelsLike.toString())),
    );
  }
}
