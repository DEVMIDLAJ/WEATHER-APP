// ignore_for_file: unused_local_variable, must_be_immutable, prefer_typing_uninitialized_variables, avoid_print, dead_code, unnecessary_string_interpolations, use_build_context_synchronously
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/const/weather_const.dart';
import 'package:weather_app/model/weaher_modal.dart';
import 'package:weather_app/controller/providers/location_provider.dart';
import 'package:weather_app/controller/weather_service.dart';
import 'package:weather_app/view/screens/main_page.dart';

class LocationDisplaySection extends StatelessWidget {
  final currentWeather;

  // Constructor to receive current weather data
  LocationDisplaySection({super.key, this.currentWeather});

  WeatherData? weather;

  @override
  Widget build(BuildContext context) {
    print('LocationDisplaySectionScreen opened');
    final TextEditingController searchController = TextEditingController();
    final _locationprovider = Provider.of<LocationProvider>(context);
    Size size = MediaQuery.of(context).size;
    String? cityName;
    // Set weather to the received currentWeather data
    weather = currentWeather;
    cityName = '${weather!.name}'.toUpperCase();
    WeatherService weathersrv = WeatherService();

    return Column(
      children: [
        SizedBox(height: size.height * 0.04),
        // Display the search bar if isSelected is true, otherwise display the selected location
        _locationprovider.isSelected
            ? AnimSearchBar(
                width: 400,
                textController: searchController,
                onSuffixTap: () async {
                  searchController.clear();
                  _locationprovider.toggleSelected();
                },
                helpText: 'Search Location....',
                rtl: true,
                autoFocus: true,
                animationDurationInMilli: 1200,
                onSubmitted: (String value) async {
                  cityName = searchController.text;
                  if (cityName != null) {
                    // Fetch current weather and forecast data for the searched city
                    var weatherData =
                        await weathersrv.fetchCityWeather(cityName!, context);
                    var forcastData =
                        await weathersrv.fetchForcastWeather(cityName!);
                    print('weatherdata: $weatherData');
                    print('forcastdata: $forcastData');
                    _locationprovider.toggleSelected();
                    // Navigate to the MainScreen with the fetched data
                    if (weatherData != null && forcastData != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            currentWeather: weatherData,
                            forecastWeather: forcastData,
                          ),
                        ),
                      );
                    }
                  }
                },
              )
            : GestureDetector(
                onTap: () {
                  _locationprovider.toggleSelected();
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 30,
                  ),
                  title: Text(
                    cityName,
                    style: const TextStyle(
                        color: colorBg2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ],
    );
  }
}
