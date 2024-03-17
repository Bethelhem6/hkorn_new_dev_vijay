// ignore_for_file: non_constant_identifier_names

class NewsModel {
  final int news_id;
  final String news_title;
  final String images;

  Map<String, dynamic> toMap() {
    return {
      'news_id': news_id,
      'news_title': news_title,
      'images': images,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      news_id: map['news_id'] as dynamic,
      news_title: map['news_title'] as dynamic,
      images: map['images'] as dynamic,
    );
  }

  const NewsModel({
    required this.news_id,
    required this.news_title,
    required this.images,
  });
}
