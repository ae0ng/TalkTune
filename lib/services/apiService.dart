import 'package:talk_tune/model/question.dart';
import 'package:talk_tune/model/result.dart';
import 'package:talk_tune/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var initUrl = 'http://172.19.88.231:5000';

class ResultApi {
  Future<Result> fetchResult() async {
    var url = Uri.parse('$initUrl/upload');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> resultJson = json.decode(response.body);
        return Result.fromJson(resultJson);
      } else {
        throw Exception('Failed to load results');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class QuestionApi {
  Future<List<Question>> fetchQuestion() async {
    var url = Uri.parse('$initUrl/get_questions');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> questionJson = json.decode(response.body);
        return questionJson.map((json) => Question.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class WavApi {
  static Future<void> uploadWav(String filePath) async {
    var url = Uri.parse('$initUrl/upload');
    var request = http.MultipartRequest('POST', url);
    try {
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file');
      }
    } catch (e) {
      print('Error during file upload: $e');
    }
  }
}
