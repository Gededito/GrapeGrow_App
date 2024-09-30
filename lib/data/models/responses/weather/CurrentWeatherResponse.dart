import 'dart:convert';

class CurrentWeatherResponse {
  final double temp;
  final String weatherCategory;
  final String condition;
  final double humidity;
  final double windSpeed;
  final DateTime date;

  CurrentWeatherResponse({
    required this.temp,
    required this.weatherCategory,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.date
  });

  factory CurrentWeatherResponse.fromJson(String str)
    => CurrentWeatherResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrentWeatherResponse.fromMap(Map<String, dynamic> json) {
    return CurrentWeatherResponse(
      temp: (json['temp']).toDouble(),
      weatherCategory: json['weather'][0]['main'],
      condition: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed']).toDouble(),
      date: DateTime.fromMicrosecondsSinceEpoch(json['dt'] * 1000),
    );
  }

  Map<String, dynamic> toMap() => {
    'temp': temp,
    'weatherCategory': weatherCategory,
    'condition': condition,
    'humidity': humidity,
    'windSpeed': windSpeed,
    'date': date.toIso8601String(),
  };
}