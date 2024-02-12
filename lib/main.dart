import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services package for setting orientation
import 'package:traveller/pages/home_page.dart';
import 'package:traveller/pages/login_page.dart';

// Global variable to hold theme state
bool isGlobalDarkMode = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  SystemChrome.setPreferredOrientations([ // Set preferred orientations
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp()); // Run the app after setting the orientations
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
