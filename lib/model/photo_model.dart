// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, prefer_if_null_operators

class PhotoModel {
  final int photo_id;
  final String photo_title;
  final String photo_images;
  final String author_image;
  final String get_avatar_url;
  final DateTime post_date;

  Map<String, dynamic> toMap() {
    return {
      'photo_id': photo_id,
      'photo_title': photo_title,
      'photo_images': photo_images == null ? '' : photo_images,
      'author_image': author_image,
      'get_avatar_url': get_avatar_url,
      'post_date': post_date.toIso8601String().toString()
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
        photo_id: map['photo_id'] as int,
        photo_title: map['photo_title'] as String,
        photo_images: map['photo_images'] == null ? '' : map['photo_images'],
        author_image: map['author_image'] as String,
        get_avatar_url: map['get_avatar_url'] as String,
        post_date: DateTime.parse(map["post_date"]));
  }

  const PhotoModel(
      {required this.photo_id,
      required this.photo_title,
      required this.photo_images,
      required this.author_image,
      required this.get_avatar_url,
      required this.post_date});
}
