// ignore_for_file: non_constant_identifier_names

class NoteDetailModel {
  final int note_id;
  final String note_title;
  final String description;
  final String created;
  final List categories;
  final String image;
  final String author;

  Map<String, dynamic> toMap() {
    return {
      'note_id': note_id,
      'note_title': note_title,
      'description': description,
      'created': created,
      'categories': categories,
      'image': image,
      'author': author,
    };
  }

  factory NoteDetailModel.fromMap(Map<dynamic, dynamic> map) {
    return NoteDetailModel(
      note_id: map['note_id'] as int,
      note_title: map['note_title'] as String,
      description: map['description'] as String,
      created: map['created'] as String,
      categories: map['categories'] as List,
      image: map['image'] as String,
      author: map['author'] as String,
    );
  }

  const NoteDetailModel({
    required this.note_id,
    required this.note_title,
    required this.description,
    required this.created,
    required this.categories,
    required this.image,
    required this.author,
  });
}
