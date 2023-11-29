// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weaher_modal.dart';

class WeatherApiCall {
  final String url;

  WeatherApiCall({required this.url});

  Future getApi(BuildContext context) async {
    print('getApi function opened');
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("--Api call successful--");
        String data = response.body;
        print(data);
        print('Exit on the getApi function');
        return WeatherData.fromJson(jsonDecode(data));
      } else {
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: const Text(
              'Location is not found!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      // Handle the exception here, for example, by showing an error message.
      print('Error in getApi: $error');
    }
  }

  Future fetchForecastData() async {
    print('fetchForecastData function opened');
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("--Api call successful--");
        print(response.statusCode);
        String data = response.body;
        print(data);
        print('Exit on the fetchForecastData function');
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      // Handle the exception here, for example, by logging the error.
      print('Error in fetchForecastData: $error');
    }
  }
}
