class PhotoDetailModel {
  String? photoId;
  String? photoTitle;
  List<String>? photoImages;
  String? authorImage;
  String? getAvatarUrl;
  DateTime? postDate;

  PhotoDetailModel(
      {this.photoId,
      this.photoTitle,
      this.photoImages,
      this.authorImage,
      this.getAvatarUrl,
      this.postDate});

  PhotoDetailModel.fromJson(Map<dynamic, dynamic> json) {
    photoId = json['photo_id'];
    photoTitle = json['photo_title'];
    photoImages = json['photo_images'].cast<String>();
    authorImage = json['author_image'];
    getAvatarUrl = json['get_avatar_url'];
    postDate = json['post_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo_id'] = photoId;
    data['photo_title'] = photoTitle;
    data['photo_images'] = photoImages;
    data['author_image'] = authorImage;
    data['get_avatar_url'] = getAvatarUrl;
    data['post_date'] = postDate;
    return data;
  }
}
