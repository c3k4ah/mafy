import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GeolocatorPlatform.instance
      .isLocationServiceEnabled()
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mafy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
    );
  }
}
