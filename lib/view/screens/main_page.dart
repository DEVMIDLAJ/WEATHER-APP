// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_local_variable, unnecessary_null_comparison, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather_app/view/widgets/forcast_data_hourly_display_section.dart';
import 'package:weather_app/view/widgets/location_display_section.dart';
import 'package:weather_app/view/widgets/main_section.dart';
import 'package:weather_app/view/widgets/sunrise_and_sunset_section.dart';
import 'package:weather_app/view/widgets/weather_detailes_section.dart';
import 'package:weather_app/view/widgets/forcast_data_daily_display_section.dart';

class MainScreen extends StatelessWidget {
  final currentWeather;
  final forecastWeather;

  // Constructor to receive current and forecast weather data
  MainScreen({
    super.key,
    this.currentWeather,
    this.forecastWeather,
  });

  // Controller for the search input field
  final TextEditingController searchController = TextEditingController();

  // Function to handle refresh action
  Future<void> refresh() async {
    // Simulate a delay for 2 seconds, then clear the search field
    await Future.delayed(const Duration(seconds: 2));
    searchController.clear();
    // Return current and forecast weather data (this looks like a placeholder)
    currentWeather;
    forecastWeather;
  }

  @override
  Widget build(BuildContext context) {
    print('mainScreen opened');
    Size size = MediaQuery.of(context).size;
    final now = DateTime.now();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  LocationDisplaySection(currentWeather: currentWeather),
                  MainSection(currentWeather: currentWeather),
                  ForcastDataHourlyDisplaySection(
                      weatherForcast: forecastWeather),
                  SunsetAndSunriceSection(currentWeather: currentWeather),
                  ForcastDataDailyDisplaySection(
                      weatherForcast: forecastWeather),
                  WeatherDetailesSection(currentWeather: currentWeather),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
