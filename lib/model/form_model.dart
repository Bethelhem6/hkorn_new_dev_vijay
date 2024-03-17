// ignore_for_file: non_constant_identifier_names

class FormModel {
  final int id;
  final String title;
  final String post_content;
  final String images;
  final String created;

  const FormModel({
    required this.id,
    required this.title,
    required this.post_content,
    required this.images,
    required this.created,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'post_content': post_content,
      'images': images,
      'created': created,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'] as int,
      title: map['title'] as String,
      post_content: map['post_content'] as String,
      images: map['images'] as String,
      created: map['created'] as String,
    );
  }
}
