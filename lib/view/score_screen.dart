import 'package:flutter/material.dart';
import 'package:talk_tune/services/apiService.dart';
import 'package:talk_tune/model/result.dart';
import 'package:talk_tune/model/question.dart';

class ScoreScreen extends StatefulWidget {
  final Question question;
  const ScoreScreen({super.key, required this.question});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late Future<Result> futureResult;

  @override
  void initState() {
    super.initState();
    futureResult = ResultApi().fetchResult();
  }

  @override
  Widget build(BuildContext context) {
    final Question question = widget.question;

    return Scaffold(
      body: Column(
        children: [
          ColoredBox(
            color: const Color(0xff4F6F52),
            child: Column(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Q${question.id}. ${question.question}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
                FutureBuilder<Result>(
                  future: futureResult,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      Result result = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${result.totalScore}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                '/100',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${result.fillerScore}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text('"간투어 사용 횟수"'),
                                  Text('${result.fillerWordCount}'),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${result.rateScore}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text('"말의 빠르기"'),
                                  Text('${result.wordCount}/min'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${result.silentScore}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text('"침묵 시간"'),
                                  Text('${result.silentTime}/min'),
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    }
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
