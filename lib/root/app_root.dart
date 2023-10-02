import 'package:flutter/material.dart';
import 'package:flutter_application_18/screan/home_screan.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScrean(),
    );
  }
}