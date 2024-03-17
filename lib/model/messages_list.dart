// ignore_for_file: non_constant_identifier_names

class MessageListModel {
  String id;
  String thread_id;
  String sender_id;
  String sender_image;
  String subject;
  String message;
  String date_sent;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'thread_id': thread_id,
      'sender_id': sender_id,
      'sender_image': sender_image,
      'subject': subject,
      'message': message,
      'date_sent': date_sent,
    };
  }

  factory MessageListModel.fromMap(Map<String, dynamic> map) {
    return MessageListModel(
      id: map['id'] as String,
      thread_id: map['thread_id'] as String,
      sender_id: map['sender_id'] as String,
      sender_image: map['sender_image'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
      date_sent: map['date_sent'] as String,
    );
  }

  MessageListModel({
    required this.id,
    required this.thread_id,
    required this.sender_id,
    required this.sender_image,
    required this.subject,
    required this.message,
    required this.date_sent,
  });
}
