// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:weather_app/const/api_key.dart';
import 'package:weather_app/const/weather_const.dart';
import 'package:weather_app/controller/api_response.dart';
import 'package:weather_app/controller/location.dart';

class WeatherService {
  Future<dynamic> fetchCityWeather(
      String cityName, BuildContext context) async {
    print('fetchcityweather opened');
    try {
      var url = '$base_url?q=$cityName&appid=$api_Key&units=metric';
      WeatherApiCall netApi = WeatherApiCall(url: url);
      var weatherData = await netApi.getApi(context);
      print('Exit on the fetchCityWeather function');
      return weatherData;
    } catch (error) {
      // Handle the exception here, for example, by showing an error message.
      print('Error in fetchCityWeather: $error');
      // You can return null or any other suitable value in case of an error.
      return null;
    }
  }

  Future<dynamic> fetchCurrentLocation(BuildContext context) async {
    print('fetchCurrentLocation opened');
    try {
      Location location = Location();
      await location.fetchCurrentLocation();
      var url =
          '$base_url?lat=${location.latitude}&lon=${location.longitude}&appid=$api_Key&units=metric';
      WeatherApiCall netApi = WeatherApiCall(url: url);
      var weatherData = await netApi.getApi(context);
      print('Exit on the fetchCurrentLocation function');
      return weatherData;
    } catch (error) {
      // Handle the exception here, for example, by showing an error message.
      print('Error in fetchCurrentLocation: $error');
      // You can return null or any other suitable value in case of an error.
      return null;
    }
  }

  Future<dynamic> fetchForcastWeather(String cityName) async {
    print('fetch forcast weather opened');
    try {
      Location location = Location();
      await location.fetchLocationDetails(cityName);
      var url =
          '$weatherForecastApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$onecall_ApiKey&units=metric';
      WeatherApiCall netApi = WeatherApiCall(url: url);
      var weatherData = await netApi.fetchForecastData();
      print('Exit on the fetchForcastWeather function');
      return weatherData;
    } catch (error) {
      // Handle the exception here, for example, by showing an error message.
      print('Error in fetchForcastWeather: $error');
      // You can return null or any other suitable value in case of an error.
      return null;
    }
  }

  Future<dynamic> fetchCurrentForecast() async {
    print('fetchCurrentForecast opened');
    try {
      Location location = Location();
      await location.fetchCurrentLocation();
      var url =
          '$weatherForecastApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$onecall_ApiKey&units=metric';
      WeatherApiCall netApi = WeatherApiCall(url: url);
      var weatherData = await netApi.fetchForecastData();
      print('Exit on the fetchCurrentForecast function');
      return weatherData;
    } catch (error) {
      // Handle the exception here, for example, by showing an error message.
      print('Error in fetchCurrentForecast: $error');
      // You can return null or any other suitable value in case of an error.
      return null;
    }
  }
}
