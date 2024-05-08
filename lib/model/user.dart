class User {
  final String avgScore; // 평균 점수
  final String totalReply; // 전체 답변 수

  User({
    required this.avgScore,
    required this.totalReply,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avgScore: json['avgScore'] as String,
      totalReply: json['totalReply'] as String,
    );
  }
}
