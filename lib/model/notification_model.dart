// ignore_for_file: non_constant_identifier_names

class NotificationModel {
  final String id;
  final String user_id;
  final String user_image;
  final String item_id;
  final String secondary_item_id;
  final String component_name;
  final String component_action;
  final String date_notified;
  final String is_new;

  const NotificationModel({
    required this.id,
    required this.user_id,
    required this.item_id,
    required this.user_image,
    required this.secondary_item_id,
    required this.component_name,
    required this.component_action,
    required this.date_notified,
    required this.is_new,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'item_id': item_id,
      'secondary_item_id': secondary_item_id,
      'component_name': component_name,
      'component_action': component_action,
      'date_notified': date_notified,
      'is_new': is_new,
      'user_image': user_image,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as String,
      user_id: map['user_id'] as String,
      user_image: map['user_image'] as String,
      item_id: map['item_id'] as String,
      secondary_item_id: map['secondary_item_id'] as String,
      component_name: map['component_name'] as String,
      component_action: map['component_action'] as String,
      date_notified: map['date_notified'] as String,
      is_new: map['is_new'] as String,
    );
  }
}
