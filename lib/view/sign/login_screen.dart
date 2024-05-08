import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:talk_tune/view/main/main_screen.dart';
import 'package:talk_tune/view/sign/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool autoLogin = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future userLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://172.19.88.231:5000/login');
    var data = {"email": email, "password": password};

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 5),
                  child: Image.asset(
                    'assets/images/logo_g.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  child: Text(
                    'TALK TUNE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    'Mobile Services!',
                    style: TextStyle(
                      color: Color(0xffC5CFB5),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    "Sign in to continue",
                    style: TextStyle(
                      color: Color(0xff8F8E8E),
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("ID"),
                ),
                SizedBox(
                  width: 300,
                  child: CupertinoTextField(
                    controller: emailController,
                    placeholder: 'talk_tune',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("PASSWORD"),
                ),
                SizedBox(
                  width: 300,
                  child: CupertinoTextField(
                    controller: passwordController,
                    placeholder: '*****',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: ElevatedButton(
                    onPressed: userLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4F6F52),
                      fixedSize: const Size(300, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4F6F52),
                    fixedSize: const Size(300, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'New Account!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
