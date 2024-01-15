import 'dart:async';
import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(
          Duration(seconds: 2),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 4.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.linear,
                  ),
                ),
                child: Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: Image.asset(
                    'images/logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
