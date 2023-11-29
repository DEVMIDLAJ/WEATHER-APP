// import 'dart:async';
// import 'package:flutter/material.dart';

// // class ThemeProvider with ChangeNotifier {
// // bool _isThemeDark = false;
// // // bool isloading = false;

// // get themeMode => _isThemeDark;

// // toggletheme(bool togglevalue) {
// //   _isThemeDark = togglevalue;
// //   notifyListeners();
// // }

// //  changeThemeByTime() {
// //   Timer.periodic(const Duration(seconds: 1), (timer) {
// //     final currentTime = DateTime.now();
// //     final currentHour = currentTime.hour;
// //     final currentMinute = currentTime.minute;

// //     if (currentHour >= 16 && currentMinute >= 20 && currentHour <= 6 && currentMinute >=00) {
// //       // Set dark theme when it's 12:15 or later
// //       toggletheme(true);
// //     } else {
// //       // Set light theme at other times
// //       toggletheme(false);
// //     }
// //   });
// //   notifyListeners();
// // }

// class ThemeProvider with ChangeNotifier {

//   bool _isDarkTheme = false;

//    // dark theam
//   final darkTheme = ThemeData(
//     primaryColor: Colors.black,
//     scaffoldBackgroundColor: Colors.black,
//     brightness: Brightness.dark,
//   );

// // Light theam
//   final lightTheme = ThemeData(
//       primaryColor: const Color.fromARGB(255, 56, 101, 138),
//       scaffoldBackgroundColor:const Color.fromARGB(255, 56, 101, 138),
//       brightness: Brightness.light,
//       );

//   ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

//   void toggleTheme() {
//     _isDarkTheme = !_isDarkTheme;
//     notifyListeners();
//   }

//   void autoChangeThemeByTime() {
//     final currentTime = DateTime.now();
//     final currentHour = currentTime.hour;
//     final currentMinute = currentTime.minute;

//     if ((currentHour > 16 || (currentHour == 52 && currentMinute >= 00)) ||
//         (currentHour < 6 || (currentHour == 6 && currentMinute <= 30))) {
//       if (!_isDarkTheme) {
//         toggleTheme();
//       }
//     } else {
//       if (_isDarkTheme) {
//         toggleTheme();
//       }
//     }
//   }

//   void startAutoThemeChange() {
//     Timer.periodic(const Duration(minutes: 1), (timer) {
//       autoChangeThemeByTime();
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/weather_const.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  void autoChangeThemeByTime() {
    var currentHour = DateFormat.H().format(DateTime.now());
    ;

    // Set dark theme from 6:30 PM to 6:30 AM
    _isDarkTheme = int.parse(currentHour) >= 18 || int.parse(currentHour) <= 6;

    notifyListeners();
  }
}
