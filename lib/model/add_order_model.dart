// ignore_for_file: non_constant_identifier_names

class AddOrderModel {
  final int user_id;
  final String firstname;
  final String lastname;
  final String company_name;
  final String country;
  final String street_address;
  final String town_district;
  final String region;
  final String postcode;
  final String phone;
  final String email;
  final String order_note;

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'firstname': firstname,
      'lastname': lastname,
      'company_name': company_name,
      'country': country,
      'street_address': street_address,
      'town_district': town_district,
      'region': region,
      'postcode': postcode,
      'phone': phone,
      'email': email,
      'order_note': order_note,
    };
  }

  factory AddOrderModel.fromMap(Map<String, dynamic> map) {
    return AddOrderModel(
      user_id: map['user_id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      company_name: map['company_name'] as String,
      country: map['country'] as String,
      street_address: map['street_address'] as String,
      town_district: map['town_district'] as String,
      region: map['region'] as String,
      postcode: map['postcode'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      order_note: map['order_note'] as String,
    );
  }

  const AddOrderModel({
    required this.user_id,
    required this.firstname,
    required this.lastname,
    required this.company_name,
    required this.country,
    required this.street_address,
    required this.town_district,
    required this.region,
    required this.postcode,
    required this.phone,
    required this.email,
    required this.order_note,
  });
}
