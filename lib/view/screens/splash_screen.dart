// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, annotate_overrides, avoid_print, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/theam_provider.dart';
import 'package:weather_app/controller/weather_service.dart';
import 'package:weather_app/view/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, Key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    fetchLocationData();
    super.initState();
  }

  // Initialize a subscription to listen for connectivity changes
  late StreamSubscription subscription;
  // Initialize flags to track device connectivity and alerts
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  // Method to fetch location data
  fetchLocationData() async {
    print('fetchLocationData opened');
    // Listen for connectivity changes
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        // If device is connected to the internet
        if (isDeviceConnected == true) {
          WeatherService weathersrv = WeatherService();
          var status = await Permission.location.status;
          // Handle location permission status
          if (status.isPermanentlyDenied) {
            await Geolocator.openLocationSettings();
          } else {
            await Permission.location.request();
          }
          // Fetch weather data
          var weatherData = await weathersrv.fetchCurrentLocation(context);
          var forecastData = await weathersrv.fetchCurrentForecast();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                currentWeather: weatherData,
                forecastWeather: forecastData,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('spalsh scareen opened');
       final _themeprovider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDeviceConnected == true
                ? const Text(
                    "Weather App,",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                // If there's no internet connection and an alert is set
                : const Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please Check Your Internet Connection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
