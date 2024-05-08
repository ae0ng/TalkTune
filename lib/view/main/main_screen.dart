import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talk_tune/view/QList/history_screen.dart';
import 'package:talk_tune/view/QList/question_screen.dart';
import 'package:talk_tune/model/user.dart';
import 'package:talk_tune/services/apiService.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      child: const Text(
                        '프로필',
                        style: TextStyle(
                          color: Color(0xff4F6F52),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/specch_bubble.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '개',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/clock.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '2',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '분',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ToTal',
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '75',
                              style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' /100',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDBE7C9),
              fixedSize: const Size(300, 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const questionScreen(),
                ),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              fixedSize: const Size(300, 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '보관함',
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
