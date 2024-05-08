import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talk_tune/services/apiService.dart';
import 'package:talk_tune/model/question.dart';
import 'package:talk_tune/view/main/main_screen.dart';
import 'package:talk_tune/view/record_screen.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});

  @override
  State<questionScreen> createState() => _questionScreenState();
}

class _questionScreenState extends State<questionScreen> {
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
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/images/arrow.png',
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Image.asset(
                  'assets/images/List.png',
                  width: 158,
                  height: 68,
                  alignment: Alignment.center,
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            FutureBuilder<List<Question>>(
                future: futureQuestions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                  }
                  return Flexible(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        Question q = snapshot.data![index];
                        return ListTile(
                          title: Text('${q.id}. ${q.question}'),
                          titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            height: 2,
                            color: Colors.black,
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
                }),
          ],
        ),
      ),
    );
  }
}
