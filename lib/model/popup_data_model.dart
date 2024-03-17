// ignore_for_file: non_constant_identifier_names

class PopupData {
  final String popup_id;
  final String popup_title;
  final String popup_content;

  Map<String, dynamic> toMap() {
    return {
      'popup_id': popup_id,
      'popup_title': popup_title,
      'popup_content': popup_content,
    };
  }

  factory PopupData.fromMap(Map<String, dynamic> map) {
    return PopupData(
      popup_id: map['popup_id'].toString(),
      popup_title: map['popup_title'] as String,
      popup_content: map['popup_content'] as String,
    );
  }

  const PopupData({
    required this.popup_id,
    required this.popup_title,
    required this.popup_content,
  });
}
