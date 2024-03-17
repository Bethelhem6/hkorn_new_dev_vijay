class ContactFormModel {
  final String name;
  final String email;
  final String subject;
  final String message;

  const ContactFormModel({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }

  factory ContactFormModel.fromMap(Map<String, dynamic> map) {
    return ContactFormModel(
      name: map['name'] as String,
      email: map['email'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
    );
  }
}
