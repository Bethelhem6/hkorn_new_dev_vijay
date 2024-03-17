// ignore_for_file: non_constant_identifier_names

class OrderDetailModel {
  final int order_id;
  final String order_number;
  final String order_date;
  final String status;
  final String shipping_total;
  final String shipping_tax_total;
  final String fee_total;
  final String fee_tax_total;
  final String tax_total;
  final String cart_discount;
  final String order_discount;
  final String discount_total;
  final String order_total;
  final String order_currency;
  final String payment_method;
  final String shipping_method;
  final int customer_id;
  final String customer_user;
  final String customer_email;
  final String billing_first_name;
  final String billing_last_name;
  final String billing_company;
  final String billing_address_1;
  final String billing_email;
  final String billing_phone;
  final String billing_address_2;
  final String billing_postcode;
  final String billing_city;
  final String billing_state;
  final String billing_country;
  final String shipping_first_name;
  final String shipping_company;
  final String shipping_address_2;
  final String shipping_city;
  final String shipping_country;
  final String download_permissions;
  final List product_data;

  Map<String, dynamic> toMap() {
    return {
      'order_id': order_id,
      'order_number': order_number,
      'order_date': order_date,
      'status': status,
      'shipping_total': shipping_total,
      'shipping_tax_total': shipping_tax_total,
      'fee_total': fee_total,
      'fee_tax_total': fee_tax_total,
      'tax_total': tax_total,
      'cart_discount': cart_discount,
      'order_discount': order_discount,
      'discount_total': discount_total,
      'order_total': order_total,
      'order_currency': order_currency,
      'payment_method': payment_method,
      'shipping_method': shipping_method,
      'customer_id': customer_id,
      'customer_user': customer_user,
      'customer_email': customer_email,
      'billing_first_name': billing_first_name,
      'billing_last_name': billing_last_name,
      'billing_company': billing_company,
      'billing_address_1': billing_address_1,
      'billing_email': billing_email,
      'billing_phone': billing_phone,
      'billing_address_2': billing_address_2,
      'billing_postcode': billing_postcode,
      'billing_city': billing_city,
      'billing_state': billing_state,
      'billing_country': billing_country,
      'shipping_first_name': shipping_first_name,
      'shipping_company': shipping_company,
      'shipping_address_2': shipping_address_2,
      'shipping_city': shipping_city,
      'shipping_country': shipping_country,
      'download_permissions': download_permissions,
      'product_data': product_data,
    };
  }

  factory OrderDetailModel.fromMap(Map<dynamic, dynamic> map) {
    return OrderDetailModel(
      order_id: map['order_id'] as int,
      order_number: map['order_number'] as String,
      order_date: map['order_date'] as String,
      status: map['status'] as String,
      shipping_total: map['shipping_total'] as String,
      shipping_tax_total: map['shipping_tax_total'] as String,
      fee_total: map['fee_total'] as String,
      fee_tax_total: map['fee_tax_total'] as String,
      tax_total: map['tax_total'] as String,
      cart_discount: map['cart_discount'] as String,
      order_discount: map['order_discount'] as String,
      discount_total: map['discount_total'] as String,
      order_total: map['order_total'] as String,
      order_currency: map['order_currency'] as String,
      payment_method: map['payment_method'] as String,
      shipping_method: map['shipping_method'] as String,
      customer_id: map['customer_id'] as int,
      customer_user: map['customer_user'] as String,
      customer_email: map['customer_email'] as String,
      billing_first_name: map['billing_first_name'] as String,
      billing_last_name: map['billing_last_name'] as String,
      billing_company: map['billing_company'] as String,
      billing_address_1: map['billing_address_1'] as String,
      billing_email: map['billing_email'] as String,
      billing_phone: map['billing_phone'] as String,
      billing_address_2: map['billing_address_2'] as String,
      billing_postcode: map['billing_postcode'] as String,
      billing_city: map['billing_city'] as String,
      billing_state: map['billing_state'] as String,
      billing_country: map['billing_country'] as String,
      shipping_first_name: map['shipping_first_name'] as String,
      shipping_company: map['shipping_company'] as String,
      shipping_address_2: map['shipping_address_2'] as String,
      shipping_city: map['shipping_city'] as String,
      shipping_country: map['shipping_country'] as String,
      download_permissions: map['download_permissions'] as String,
      product_data: map['product_data'] as List,
    );
  }

  const OrderDetailModel({
    required this.order_id,
    required this.order_number,
    required this.order_date,
    required this.status,
    required this.shipping_total,
    required this.shipping_tax_total,
    required this.fee_total,
    required this.fee_tax_total,
    required this.tax_total,
    required this.cart_discount,
    required this.order_discount,
    required this.discount_total,
    required this.order_total,
    required this.order_currency,
    required this.payment_method,
    required this.shipping_method,
    required this.customer_id,
    required this.customer_user,
    required this.customer_email,
    required this.billing_first_name,
    required this.billing_last_name,
    required this.billing_company,
    required this.billing_address_1,
    required this.billing_email,
    required this.billing_phone,
    required this.billing_address_2,
    required this.billing_postcode,
    required this.billing_city,
    required this.billing_state,
    required this.billing_country,
    required this.shipping_first_name,
    required this.shipping_company,
    required this.shipping_address_2,
    required this.shipping_city,
    required this.shipping_country,
    required this.download_permissions,
    required this.product_data,
  });
}
