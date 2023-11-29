
import 'package:weather_app/model/weaher_modal.dart';

class WeatherDetailesModel {
  final String? imageUrl;
  final String? text;
  final String? value1;
  final String? value2;
  WeatherData? weather;

  WeatherDetailesModel({
    required this.imageUrl,
    required this.text,
    required this.value1,
    required this.value2,

  });
}
