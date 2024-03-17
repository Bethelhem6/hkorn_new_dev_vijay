class ContactForm {
  final String name;
  final String email;
  final String subject;
  final String message;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }

  factory ContactForm.fromMap(Map<String, dynamic> map) {
    return ContactForm(
      name: map['name'] as String,
      email: map['email'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
    );
  }

  const ContactForm({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });
}
