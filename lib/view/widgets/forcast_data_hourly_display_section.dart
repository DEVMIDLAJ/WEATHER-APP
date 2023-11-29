// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/weather_const.dart';

class ForcastDataHourlyDisplaySection extends StatelessWidget {
  final weatherForcast;

  // Constructor to receive weather forecast data
  ForcastDataHourlyDisplaySection({super.key, this.weatherForcast});

  Map<String, dynamic>? forcastWeather;

  @override
  Widget build(BuildContext context) {
    print('ForcastDataHourlyDisplaySection Screen opened');
    Size size = MediaQuery.of(context).size;
    // Set forcastWeather to the received weatherForcast data
    forcastWeather = weatherForcast;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "NEXT 24 HOURS",
            style: TextStyle(color: colorBg2, fontSize: 15),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height / 5,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(45, 85, 116, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (BuildContext context, int index) {
              // Extract hourly forecast data for the current index
              var forecastDatatHourly = forcastWeather!['hourly'][index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Display the time in 12-hour format
                      Text(
                        DateFormat('hh:mm a')
                            .format(DateTime.parse(
                                DateTime.fromMillisecondsSinceEpoch(
                                        forecastDatatHourly['dt'] * 1000)
                                    .toString()))
                            .toString(),
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      // Display the weather icon corresponding to the hourly forecast
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          child: Image(
                            image: AssetImage('assets/weather/${forecastDatatHourly['weather'][0]['main']}.png'),
                          ),
                        ),
                      ),
                      // Display the temperature in degrees Celsius
                      Text(
                        '${forecastDatatHourly['temp'].toInt()} °c',
                        style: GoogleFonts.kanit(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
