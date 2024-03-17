class LinksModel {
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

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  const LinksModel({
    required this.id,
    required this.title,
    required this.description,
  });
}
