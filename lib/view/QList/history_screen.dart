import 'package:flutter/material.dart';
import 'package:talk_tune/view/main/main_screen.dart';
import 'package:talk_tune/view/record_screen.dart';
import 'package:talk_tune/services/apiService.dart';
import 'package:talk_tune/model/question.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<Question>> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = QuestionApi().fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'LIST',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            child: const Text('뒤로가기'),
          ),
          FutureBuilder(
              future: futureQuestions,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                }
                return Flexible(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      Question q = snapshot.data![index];
                      return ListTile(
                        title: Text('${q.id} ${q.question}'),
                        titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => recordScreen(
                                question: q,
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                );
              })
        ],
      ),
    ));
  }
}
