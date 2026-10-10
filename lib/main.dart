import 'package:flutter/material.dart';
import 'package:tailor_manegment/add_customer.dart';
import 'package:tailor_manegment/customer_details.dart';
import 'package:tailor_manegment/edit_customer.dart';
import 'package:tailor_manegment/empty_state.dart';
import 'package:tailor_manegment/home_screen.dart';
import 'package:tailor_manegment/splash_screen.dart';

void main() {
  runApp(const TailorApp());
}

class TailorApp extends StatelessWidget {
  const TailorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tailor App',

      theme: ThemeData(
        useMaterial3: true,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Blue
          foregroundColor: Colors.white,      // Text + Icons White
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2563EB),
          foregroundColor: Colors.white,
        ),
      ),

      home: SplashScreen(),
    );
  }
}