class GroupAlbumModel {
  final String albumId;
  final String albumTitle;
  final String albumCreated;
  final int albumImageCount;

  Map<String, dynamic> toMap() {
    return {
      'album_id': albumId,
      'album_title': albumTitle,
      'date_created': albumCreated,
      'album_images_count': albumImageCount,
    };
  }

  factory GroupAlbumModel.fromMap(Map<dynamic, dynamic> map) {
    return GroupAlbumModel(
      albumId: map['album_id'] as String,
      albumTitle: map['album_title'] as String,
      albumCreated: map['date_created'] as String,
      albumImageCount: map['album_images_count'] as int,
    );
  }

  const GroupAlbumModel({
    required this.albumId,
    required this.albumTitle,
    required this.albumCreated,
    required this.albumImageCount,
  });
}
