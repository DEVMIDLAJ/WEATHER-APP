// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/weather_const.dart';
import 'package:weather_app/model/weaher_modal.dart';

class MainSection extends StatelessWidget {
  final currentWeather;

  // Constructor to receive current weather data
  MainSection({super.key, this.currentWeather});

  WeatherData? weather;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print('MainSectionScreen opened');

    Size size = MediaQuery.of(context).size;
    // Set weather to the received currentWeather data
    weather = currentWeather;

    return Column(
      children: [
        SizedBox(
          height: size.height / 30,
        ),
        SizedBox(
          height: size.height / 5,
          width: size.width / 3,
          child: ClipRRect(
            child: Image(
              image: AssetImage(
                "assets/weather/${weather!.weather[0].main}.png",
              ),
            ),
          ),
        ),
        Row(
          children: [
            Center(
              child: Text(
                '${weather!.main.temp.round()}°c',
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '${weather!.weather[0].main}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              DateFormat('EEEE-dd-MMM').format(now),
              style: const TextStyle(
                color: colorBg2,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
