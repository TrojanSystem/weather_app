class WeatherModel {
  double? temp_min;
  double? temp_max;

  int? sea_level;
  int? grnd_level;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;




  WeatherModel({
    required this.sea_level,
    required this.grnd_level,
    required this.temp_min,
    required this.temp_max,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,

  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    sea_level = json['sea_level'];
    grnd_level = json['grnd_level'];
    temp_min = json['temp_min'];
    temp_max = json['temp_min'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sea_level'] = sea_level;
    data['grnd_level'] = grnd_level;
    data['temp_min'] = temp_min;
    data['temp_max'] = temp_max;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;


    return data;
  }
}
