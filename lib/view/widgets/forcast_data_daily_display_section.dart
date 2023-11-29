// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/weather_const.dart';

class ForcastDataDailyDisplaySection extends StatelessWidget {
  final weatherForcast;
  
  // Constructor to receive weather forecast data
  ForcastDataDailyDisplaySection({super.key, this.weatherForcast});

  Map<String, dynamic>? forcastWeather;

  @override
  Widget build(BuildContext context) {
    print('ForcastDataDailyDisplaySectionScreen opened');

    // Set forcastWeather to the received weatherForcast data
    forcastWeather = weatherForcast;
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(color: colorBg2, fontSize: 15),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height / 1.42,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(45, 85, 116, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount:
                (forcastWeather != null && forcastWeather!['daily'] != null)
                    ? forcastWeather!['daily'].length
                    : forcastWeather!.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              // Extract daily forecast data for the current index
              var forecastDataDaily = forcastWeather!['daily'][index];
              
              // Display forecast data in a row
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display the date formatted as 'dd-MM-yyyy'
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.parse(
                        DateTime.fromMillisecondsSinceEpoch(
                                forecastDataDaily['dt'] * 1000)
                            .toString())),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  // Display the weather icon corresponding to the forecast
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage('assets/weather/${forecastDataDaily['weather'][0]['main']}.png'),
                      ),
                    ),
                  ),
                  
                  // Display the temperature in degrees Celsius
                  Text(
                    '${forecastDataDaily['temp']['day'].toInt()} °c',
                    style: GoogleFonts.kanit(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
