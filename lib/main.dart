import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_tune/view/main/home_screen.dart';
import 'package:talk_tune/view/main/splash_screen.dart';

void main() async {
  runApp(const HomeScreen());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final Question q= Question(id: 1, text:'자신의 장점과 단점을 말해주세요' );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
