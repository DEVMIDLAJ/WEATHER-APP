// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weaher_modal.dart';

class SunsetAndSunriceSection extends StatelessWidget {
  final currentWeather;

  SunsetAndSunriceSection({super.key, this.currentWeather});
  WeatherData? weather;

  @override
  Widget build(BuildContext context) {
    print('SunsetAndSunriceSectionScreen opened');
    Size size = MediaQuery.of(context).size;
    weather = currentWeather;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        Container(
          height: size.height / 5,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(45, 85, 116, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/sunrise.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/sunset.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat('hh:mm ').format(DateTime.fromMillisecondsSinceEpoch(weather!.sys.sunset * 1000))}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${DateFormat('hh:mm ').format(DateTime.fromMillisecondsSinceEpoch(weather!.sys.sunrise * 1000))}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
