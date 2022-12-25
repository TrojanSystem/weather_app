import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework/weather/bloc.dart';
import 'package:framework/weather/event.dart';
import 'package:framework/weather/state.dart';
import 'package:framework/weather_data.dart';
import 'package:framework/weather_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(WeatherData()),
        child: const WeatherApp(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key, required this.title});

  final String title;

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    final blocWeather = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsLoading) {
            return buildLoadingScreen(blocWeather);
          } else if (state is WeatherIsLoaded) {
            return WeatherDetail(cityName: state.fetchedWeather,);
          } else if (state is WeatherIsNotLoaded) {
            return buildErrorScreen(state.errorMessage.toString());
          }
          return buildMainScreen(blocWeather);
        },
      ),
    );
  }

  buildMainScreen(WeatherBloc blocWeather) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Search Weather',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            'Instantly',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: blocWeather.cityController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'City Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              blocWeather.add(
                FetchWeather(cityName: blocWeather.cityController.text),
              );
              print(WeatherData().getWord(blocWeather.cityController.text));
              blocWeather.cityController.clear();
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildLoadingScreen(WeatherBloc blocWeather) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  buildErrorScreen(String message) {
    return  Center(
      child: Text(message),
    );
  }
}
