
// ignore_for_file: non_constant_identifier_names

class EventModelForPurchase {
  final String event_id;
  final String event_title;
  final String event_description;
  final String image;
  final String price;

  Map<String, dynamic> toMap() {
    return {
      'event_id': event_id,
      'event_title': event_title,
      'event_description': event_description,
      'image': image,
      'price': price,
    };
  }

  factory EventModelForPurchase.fromMap(Map<String, dynamic> map) {
    return EventModelForPurchase(
      event_id: map['event_id'] as String,
      event_title: map['event_title'] as String,
      event_description: map['event_description'] as String,
      image: map['image'] as String,
      price: map['price'] as String,
    );
  }

  const EventModelForPurchase({
    required this.event_id,
    required this.event_title,
    required this.event_description,
    required this.image,
    required this.price,
  });
}
