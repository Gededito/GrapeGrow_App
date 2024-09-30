//
// import 'dart:convert';
//
// class WeeklyWeatherResponse {
//   final List<WeeklyWeatherResponseItem>? weeklyWeatherResponse;
//
//   WeeklyWeatherResponse({this.weeklyWeatherResponse});
//
//   factory WeeklyWeatherResponse.fromJson(String str) =>
//     WeeklyWeatherResponse.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory WeeklyWeatherResponse.fromMap(Map<String, dynamic> json) {
//     return WeeklyWeatherResponse(
//       weeklyWeatherResponse: List<WeeklyWeatherResponseItem>.from(json["WeeklyWeatherResponse"].map((x) => WeeklyWeatherResponse.fromMap(x)))
//     );
//   }
//
//   Map<String, dynamic> toMap() => {
//     "WeeklyWeatherResponse": List<WeeklyWeatherResponse>.from(weeklyWeatherResponse!.map((x) => x.toMap())),
//   };
// }
//
// class WeeklyWeatherResponseItem {
//   final String? date;
//   final String? path;
//   final double? temperature;
//   final String? icon;
//   final String? description;
//   final String? main;
//
//   WeeklyWeatherResponseItem({
//     this.date,
//     this.path,
//     this.temperature,
//     this.icon,
//     this.description,
//     this.main,
//   });
//
//   factory WeeklyWeatherResponseItem.fromJson(String str) => WeeklyWeatherResponseItem.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory WeeklyWeatherResponseItem.fromMap(Map<String, dynamic> json) {
//     return WeeklyWeatherResponseItem(
//       date: json['date'],
//       path: json['path'],
//       temperature: json['temperature']?.toDouble(),
//       icon: json['icon'],
//       description: json['description'],
//       main: json['main'],
//     );
//   }
//
//   Map<String, dynamic> toMap() => {
//     "date": date,
//     "path": path,
//     "temperature": temperature,
//     "icon": icon,
//     "description": description,
//     "main": main
//   };
// }