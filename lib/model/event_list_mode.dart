// {
// "event_id": "2682",
// "event_title": "HKORN NEW MEMBERSHIP",
// "event_description": "<h3>Application for New Membership (April 2021- March 2022)</h3>\r\n<h3>New Membership Fee $200 ($100 Sign up Fee + $100 One-year membership Fee)</h3>\r\n<h3>Payment method:</h3>\r\n<ol>\r\n \t<li> FPS 付款 (FPS: 164037426)</li>\r\n</ol>\r\nCash payment is not accepted.",
// "image": "https://hkornrenew.mockup-design.com/wp-content/uploads/2021/03/HKORN_MEMBERSHIP_Subscription_smallwhitebg.png",
// "price": "HK$200"
// },

// ignore_for_file: non_constant_identifier_names

class EventDataModel {
  final int event_id;
  final String event_title;
  final String event_description;
  final String image;
  final String? date;
  final String price;

  Map<String, dynamic> toMap() {
    return {
      'event_id': event_id,
      'event_title': event_title,
      'event_description': event_description,
      'image': image,
      'date': date,
      'price': price,
    };
  }

  factory EventDataModel.fromMap(Map<String, dynamic> map) {
    return EventDataModel(
      event_id: map['event_id'] as int,
      event_title: map['event_title'] as String,
      event_description: map['event_description'] ?? '',
      image: map['image'] ?? '',
      date: map['date'] ?? '',
      price: map['price'] ?? '',
    );
  }

  const EventDataModel({
    required this.event_id,
    required this.event_title,
    required this.event_description,
    required this.image,
    required this.price,
    required this.date,
  });
}
