
// ignore_for_file: non_constant_identifier_names

class UserModel {
  final String user_id;
  final String user_login;
  final String user_email;
  final String user_image;
  final String user_registered;
  final String display_name;

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'user_login': user_login,
      'user_email': user_email,
      'user_image': user_image,
      'user_registered': user_registered,
      'display_name': display_name,
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      user_id: map['user_id'] as String,
      user_login: map['user_login'] as String,
      user_email: map['user_email'] as String,
      user_image: map['user_image'] as String,
      user_registered: map['user_registered'] as String,
      display_name: map['display_name'] as String,
    );
  }

  const UserModel({
    required this.user_id,
    required this.user_login,
    required this.user_email,
    required this.user_registered,
    required this.user_image,
    required this.display_name,
  });

}
