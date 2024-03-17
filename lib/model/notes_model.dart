// ignore_for_file: non_constant_identifier_names

class NotesModel {
  final int note_id;
  final String note_title;
  final String post_content;
  final String images;
  final String created;

  Map<String, dynamic> toMap() {
    return {
      'note_id': note_id,
      'note_title': note_title,
      'post_content': post_content,
      'images': images,
      'created': created,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      note_id: map['note_id'] as int,
      note_title: map['note_title'] as String,
      post_content: map['post_content'] as String,
      images: map['images'] as String,
      created: map['created'] as String,
    );
  }

  const NotesModel({
    required this.note_id,
    required this.note_title,
    required this.post_content,
    required this.images,
    required this.created,
  });
}
