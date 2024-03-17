class GroupPhotoAlbumModel {
  final String albumTitle;
  final String albumImage;

  Map<String, dynamic> toMap() {
    return {
      'album_title': albumTitle,
      'album_image': albumImage,
    };
  }

  factory GroupPhotoAlbumModel.fromMap(Map<dynamic, dynamic> map) {
    return GroupPhotoAlbumModel(
      albumTitle: map['album_title'] as String,
      albumImage: map['album_image'] as String,
    );
  }

  const GroupPhotoAlbumModel({
    required this.albumTitle,
    required this.albumImage,
  });
}
