import 'dart:async';
import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/screens.home_screen');
      },
    );
  }

@override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight, // Sesuaikan dengan kebutuhan
          width: screenWidth, // Sesuaikan dengan kebutuhan
          child: Image.asset(
            'images/logo.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}