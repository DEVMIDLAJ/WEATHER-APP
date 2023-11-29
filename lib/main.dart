  // ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable
  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/location_provider.dart';
import 'package:weather_app/controller/providers/theam_provider.dart';
import 'package:weather_app/view/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LocationProvider()),
  ], child: (const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _locationprovider = Provider.of<ThemeProvider>(context,listen: false);
    
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme:_locationprovider.currentTheme,
      home: const SplashScreen(),
    );
  }
}
