import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_tune/services/UserProvider.dart';
import 'package:talk_tune/view/main/home_screen.dart';
import 'package:talk_tune/view/main/splash_screen.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
