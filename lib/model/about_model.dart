// ignore_for_file: non_constant_identifier_names

class AboutModel {
  final String id;
  final String title;
  final String description;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory AboutModel.fromMap(Map<dynamic, dynamic> map) {
    return AboutModel(
      id: map['id']?.toString()??'',
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  const AboutModel({
    required this.id,
    required this.title,
    required this.description,
  });
}
