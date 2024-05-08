class Result {
  final String reply;
  final int wordCount;
  final int silentTime;
  final int fillerWordCount;
  final int rateScore;
  final int silentScore;
  final int fillerScore;
  final int totalScore;

  Result({
    required this.reply,
    required this.wordCount,
    required this.silentTime,
    required this.fillerWordCount,
    required this.rateScore,
    required this.silentScore,
    required this.fillerScore,
    required this.totalScore,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      reply: json['reply'] as String,
      wordCount: json['wordCount'] as int,
      silentTime: json['silentTime'] as int,
      fillerWordCount: json['fillerWordCount'] as int,
      rateScore: json['rateScore'] as int,
      silentScore: json['silentScore'] as int,
      fillerScore: json['fillerScore'] as int,
      totalScore: json['totalScore'] as int,
    );
  }
}
