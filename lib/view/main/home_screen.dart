import 'package:flutter/material.dart';
import 'package:talk_tune/view/sign/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ColoredBox(
            color: const Color(0xff4F6F52),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 100, 0),
                      child: Image.asset(
                        'assets/images/logo_o.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          color: Color(0xff4F6F52),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7, 0, 10, 0),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/list_o.png',
                          width: 50,
                          height: 60,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 250,
                  child: Text(
                    '언어 습관은 T_T',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDBE7C9),
              fixedSize: const Size(300, 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Text(
                  '면접 질문',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff4F6F52),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'T_T',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff4F6F52),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDBE7C9),
              fixedSize: const Size(300, 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Text(
                  '일상 질문',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff4F6F52),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'T_T',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff4F6F52),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
