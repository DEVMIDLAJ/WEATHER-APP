import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// weather base Api url
const base_url = 'https://api.openweathermap.org/data/2.5/weather';

// weatherForecast Api Url
const weatherForecastApiUrl = 'https://api.openweathermap.org/data/2.5/onecall';

// weather Light Theme backgroundColor
const lightThemebackgroundColor = Color.fromARGB(255, 56, 101, 138);

// weather Light Theme backgroundColor
const darkThemebackgroundColor = Colors.black;

// currentHour stored a veriable
var currentHour = int.parse(DateFormat.H().format(DateTime.now()));

// dark theam
final darkTheme = ThemeData(
  primaryColor: darkThemebackgroundColor,
  scaffoldBackgroundColor: darkThemebackgroundColor,
  brightness: Brightness.dark,

);

// Light theam
final lightTheme = ThemeData(
  primaryColor: lightThemebackgroundColor,
  scaffoldBackgroundColor: lightThemebackgroundColor,
  brightness: Brightness.light

);

const colorBg1 = Color.fromARGB(255, 56, 101, 138);

const colorBg2 = Colors.white;

const textColor = Colors.white;
