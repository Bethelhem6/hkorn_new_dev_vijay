// ignore_for_file: non_constant_identifier_names

class ChairPersonModel {
  final String id;
  final String post_title;
  final String post_content;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': post_title,
      'post_content': post_content,
    };
  }

  factory ChairPersonModel.fromMap(Map<dynamic, dynamic> map) {
    return ChairPersonModel(
      id: map['id'] as String,
      post_title: map['post_title'] as String,
      post_content: map['post_content'] as String,
    );
  }

  const ChairPersonModel({
    required this.id,
    required this.post_title,
    required this.post_content,
  });
}
