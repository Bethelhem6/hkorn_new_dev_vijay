// ignore_for_file: non_constant_identifier_names

class ConstitutionModel {
  final int id;
  final String post_title;
  final String post_content;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': post_title,
      'post_content': post_content,
      'date': date.toIso8601String().toString(),
    };
  }

  factory ConstitutionModel.fromMap(Map<dynamic, dynamic> map) {
    return ConstitutionModel(
      id: map['id'] as int,
      post_title: map['post_title'] as String,
      post_content: map['post_content'] as String,
      date: DateTime.parse(map["date"]),
    );
  }

  const ConstitutionModel({
    required this.id,
    required this.post_title,
    required this.post_content,
    required this.date,
  });
}
