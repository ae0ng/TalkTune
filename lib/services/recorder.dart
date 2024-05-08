import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;
  bool get isRecording => _audioRecorder!.isRecording;
  String? _recordFilePath;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _audioRecorder!.openRecorder();
    _isRecorderInitialized = true;
  }

  Future startRecording() async {
    if (!_isRecorderInitialized) throw Exception("Recorder not initialized");
    Directory tempDir = await getTemporaryDirectory();
    _recordFilePath = '${tempDir.path}/flutter_sound.wav';
    await _audioRecorder!.startRecorder(
      toFile: _recordFilePath,
      codec: Codec.pcm16WAV,
    );
  }

  Future<void> stopRecording() async {
    if (!_isRecorderInitialized) throw Exception("Recorder not initialized");
    await _audioRecorder!.stopRecorder();
  }

  Future<String?> getFilePath() async {
    return _recordFilePath;
  }

  void dispose() {
    if (_audioRecorder != null) {
      if (_audioRecorder!.isRecording) {
        _audioRecorder!.stopRecorder();
      }
      _audioRecorder!.closeRecorder();
      _audioRecorder = null;
    }
  }
}
