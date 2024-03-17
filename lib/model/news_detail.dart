class NewsDetailModel {
  final String id;
  final String title;
  final String description;
  final String created;
  final List categories;
  final String image;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created': created,
      'categories': categories,
      'image': image,
    };
  }

  factory NewsDetailModel.fromMap(Map<dynamic, dynamic> map) {
    return NewsDetailModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      created: map['created'] as String,
      categories: map['categories'] as List,
      image: map['image'] as String,
    );
  }

  const NewsDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.created,
    required this.categories,
    required this.image,
  });
}
