class Question {
  final int id;
  final String question;
  final String answer;

  Question({
    required this.question,
    required this.id,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      id: json['id'] as int,
      answer: json['answer'] as String,
    );
  }
}
