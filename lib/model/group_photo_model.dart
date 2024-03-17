class GroupPhotoModel {
  final String photoId;
  final String photoTitle;
  final String photoUrl;

  Map<String, dynamic> toMap() {
    return {
      'photo_id': photoId,
      'photo_title': photoTitle,
      'photo_url': photoUrl,
    };
  }

  factory GroupPhotoModel.fromMap(Map<dynamic, dynamic> map) {
    return GroupPhotoModel(
      photoId: map['photo_id'] as String,
      photoTitle: map['photo_title'] as String,
      photoUrl: map['photo_url'] as String,
    );
  }

  const GroupPhotoModel({
    required this.photoId,
    required this.photoTitle,
    required this.photoUrl,
  });
}
