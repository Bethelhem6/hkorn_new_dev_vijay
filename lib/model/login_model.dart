// ignore_for_file: non_constant_identifier_names, prefer_adjacent_string_concatenation

class LoginClass {
  final String Username;
  final String Password;

//<editor-fold desc="Data Methods">

  const LoginClass({
    required this.Username,
    required this.Password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginClass &&
          runtimeType == other.runtimeType &&
          Username == other.Username &&
          Password == other.Password);

  @override
  int get hashCode => Username.hashCode ^ Password.hashCode;

  @override
  String toString() {
    return 'LoginClass{' ' Username: $Username,' +
        ' Password: $Password,' +
        '}';
  }

  LoginClass copyWith({
    String? Username,
    String? Password,
  }) {
    return LoginClass(
      Username: Username ?? this.Username,
      Password: Password ?? this.Password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': Username,
      'Password': Password,
    };
  }

  factory LoginClass.fromMap(Map<String, dynamic> map) {
    return LoginClass(
      Username: map['Username'] as String,
      Password: map['Password'] as String,
    );
  }

//</editor-fold>
}
