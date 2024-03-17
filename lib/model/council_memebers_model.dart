// ignore_for_file: non_constant_identifier_names

class CouncilMembersModel {
  final String name;
  final String image;
  final String? option_id;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'option_id': option_id,
    };
  }

  factory CouncilMembersModel.fromMap(Map<String, dynamic> map) {
    return CouncilMembersModel(
      name: map['name'] as String,
      image: map['image'] as String,
      option_id: map['option_id'] as String?,
    );
  }

  const CouncilMembersModel({
    required this.name,
    required this.image,
    required this.option_id,
  });
}

class CouncilMemberAboutModel {
  final String title;
  final String content;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  factory CouncilMemberAboutModel.fromMap(Map<String, dynamic> map) {
    return CouncilMemberAboutModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  const CouncilMemberAboutModel({
    required this.title,
    required this.content,
  });
}

class CouncilAllMemberModel {
  final String name;
  final String joinedDate;
  final bool isActive;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'joinedDate': joinedDate,
      'isActive': isActive,
    };
  }

  factory CouncilAllMemberModel.fromMap(Map<String, dynamic> map) {
    return CouncilAllMemberModel(
      name: map['name'] as String,
      joinedDate: map['user_registered'] as String,
      isActive: map['is_active'] as bool,
    );
  }

  const CouncilAllMemberModel({
    required this.name,
    required this.joinedDate,
    required this.isActive,
  });
}
