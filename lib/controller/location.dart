// ignore_for_file: avoid_print

import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/const/api_key.dart';

class Location {
  double? latitude;
  double? longitude;
  int? status;
  String apiKey = api_Key;

  // Function to fetch the current device location
  Future<void> fetchCurrentLocation() async {
    print('fetchCurrentLocation opened');
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Set latitude and longitude from the obtained position
      latitude = position.latitude;
      longitude = position.longitude;
      print('Lat: $latitude');
      print('Log: $longitude');
      print('Exit on the fetchCurrentLocation');
    } catch (e) {
      // Handle exceptions that may occur during location fetching
      print(e);
    }
  }

  // Function to fetch location details based on the provided city name
  Future<void> fetchLocationDetails(String city) async {
    print('fetchLocationDetails opened');
    GeoCode geoCode = GeoCode();
    Coordinates coordinates = await geoCode.forwardGeocoding(address: city);

    // Set latitude and longitude from the obtained coordinates
    latitude = coordinates.latitude;
    longitude = coordinates.longitude;
    print('Lat1: $latitude');
    print('Log1: $longitude');
    print('Exit on the fetchLocationDetails function');
  }
}
