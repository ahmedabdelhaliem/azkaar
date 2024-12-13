import 'package:equatable/equatable.dart';

class TodayWeather extends Equatable {
  final String? pressure;
  final String? temperature;

  const TodayWeather({this.pressure, this.temperature});

  factory TodayWeather.fromJson(Map<String, dynamic> json) => TodayWeather(
        pressure: json['pressure'] as String?,
        temperature: json['temperature'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pressure': pressure,
        'temperature': temperature,
      };

  @override
  List<Object?> get props => [pressure, temperature];
}
