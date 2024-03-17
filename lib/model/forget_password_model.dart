// ignore_for_file: prefer_adjacent_string_concatenation

class ForgetPassword {
  final String email;

//<editor-fold desc="Data Methods">

  const ForgetPassword({
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ForgetPassword &&
          runtimeType == other.runtimeType &&
          email == other.email);

  @override
  int get hashCode => email.hashCode;

  @override
  String toString() {
    return 'ForgetPassword{' ' email: $email,' + '}';
  }

  ForgetPassword copyWith({
    String? email,
  }) {
    return ForgetPassword(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory ForgetPassword.fromMap(Map<String, dynamic> map) {
    return ForgetPassword(
      email: map['email'] as String,
    );
  }

//</editor-fold>
}
