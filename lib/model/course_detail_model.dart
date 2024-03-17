class CourseDetailModel {
  final String id;
  final String title;
  final String image;
  final String description;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
    };
  }

  factory CourseDetailModel.fromMap(Map<dynamic, dynamic> map) {
    return CourseDetailModel(
      id: map['id'] as dynamic,
      title: map['title'] as dynamic,
      image: map['image'] as dynamic,
      description: map['description'] as dynamic,
    );
  }

  const CourseDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}