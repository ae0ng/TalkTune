import 'package:flutter/material.dart';
import 'dart:async';

import 'package:talk_tune/view/main/home_screen.dart';
import 'package:talk_tune/view/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff4F6F52),
        body: Center(
          child: Image.asset(
            'assets/images/logo_o.png',
            width: 240,
            height: 140,
            alignment: Alignment.center,
          ),
        ));
  }
}
