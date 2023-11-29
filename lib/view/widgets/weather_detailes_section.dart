// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather_app/const/weather_const.dart';
import 'package:weather_app/model/weaher_modal.dart';
import 'package:weather_app/model/weather_datailes_model.dart';

class WeatherDetailesSection extends StatelessWidget {
  final currentWeather;
    // Constructor to receive current weather data
  WeatherDetailesSection({super.key, this.currentWeather});

  WeatherData? weather;

  @override
  Widget build(BuildContext context) {
    weather = currentWeather;

    Size size = MediaQuery.of(context).size;

    List<WeatherDetailesModel> weatherDetailesList = [
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/feelsLike.png',
          value1: '${weather!.main.feelsLike}',
          text: 'Feels like',
          value2: ' °'),
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/swWind.png',
          value1: '${weather!.wind.speed}',
          text: 'SW wind',
          value2: ' km/h'),
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/humidity.png',
          value1: '${weather!.main.humidity}',
          text: 'Humidity',
          value2: ' %'),
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/tempmax.png',
          value1: '${weather!.main.tempMax}',
          text: 'Temp Max',
          value2: ' Moderate'),
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/visibility.png',
          value1: '${weather!.visibility / 1000}',
          text: 'Visibility',
          value2: ' km'),
      WeatherDetailesModel(
          imageUrl: 'assets/weatherDetailesAssets/airPressure.png',
          value1: '${weather!.main.pressure}',
          text: 'Air Pressure',
          value2: ' hPa'),
    ];
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "WEATHER DETAILES",
            style: TextStyle(color: colorBg2, fontSize: 15),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(top: 20, left: 15),
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(45, 85, 116, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      child: Image.asset(
                        '${weatherDetailesList[index].imageUrl}',
                        color: colorBg2,
                      ),
                    ),
                  ),
                  Text(
                    weatherDetailesList[index].text.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${weatherDetailesList[index].value1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        TextSpan(
                          text: weatherDetailesList[index].value2,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
