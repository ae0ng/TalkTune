import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:talk_tune/model/question.dart';
import 'package:talk_tune/view/score_screen.dart';
import 'package:talk_tune/services/apiService.dart';
import 'package:talk_tune/services/recorder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:talk_tune/view/QList/question_screen.dart';

class recordScreen extends StatefulWidget {
  //final Question question;
  final Question question;

  const recordScreen({super.key, required this.question});
  @override
  State<recordScreen> createState() => _recordScreenState();
}

class _recordScreenState extends State<recordScreen> {
  final SoundRecorder _soundRecorder = SoundRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? filePath;
  String? realPath;
  @override
  void initState() {
    super.initState();
    _soundRecorder.init();
  }

  @override
  void dispose() {
    _soundRecorder.dispose();
    super.dispose();
  }

  void _toggleRecording() async {
    try {
      if (_soundRecorder.isRecording) {
        await _soundRecorder.stopRecording();
        String? filePath = await _soundRecorder.getFilePath();
        if (filePath != null) {
          realPath = filePath;
          print('save file : $filePath');
          await WavApi.uploadWav(filePath);
          print('File uploaded successfully');
        } else {
          print('Recording failed: failedPath is null');
        }
      } else {
        await _soundRecorder.startRecording();
        print('Recording started');
      }
    } catch (e) {
      print('Error during recording: $e');
    }
    setState(() {});
  }

  void _playRecording() async {
    print('await recording, check your talk_tune');
    if (realPath != null && File(realPath!).existsSync()) {
      print('play recording, check your talk_tune');
      await _audioPlayer.play(UrlSource(realPath!));
    }
    print('fail recording, check your talk_tune');
  }

  @override
  Widget build(BuildContext context) {
    final Question question = widget.question;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/images/title.png',
          width: 158,
          height: 68,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            'Q${question.id}. ${question.question}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            softWrap: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        IconButton(
          onPressed: _toggleRecording,
          icon: Image.asset(
            'assets/images/logo_g.png',
            width: 140,
            height: 140,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: _playRecording,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff4F6F52),
            fixedSize: const Size(300, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            '내 답변 들어보기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreScreen(
                        question: question,
                      )),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff4F6F52),
            fixedSize: const Size(300, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            '내 점수 확인하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const questionScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff4F6F52),
            fixedSize: const Size(300, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            '돌아가기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ));
  }
}
