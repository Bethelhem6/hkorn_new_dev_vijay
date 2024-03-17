// "{
// ""cart_data"": [
// {
// ""product_id"": 2570,
// ""product_data"": {
// ""name"": ""HKORN MEMBERSHIP RENEWAL"",
// ""description"": ""<h3>Annual Subscription for renewal of membership (all types – ordinary / affiliated / retired):</h3>\r\n<h3>$50 per year (special offer from now to Apr 30, original $100 per year)</h3>\r\n<h3>Payment method:</h3>\r\n<ol>\r\n \t<li>FPS 付款 (FPS: 164037426)</li>\r\n</ol>\r\nCash payment is not accepted."",
// ""regular_price"": ""50"",
// ""sale_price"": """",
//                 ""price"": ""50"",
//                 ""image"": ""https://hkornrenew.mockup-design.com/wp-content/uploads/2021/03/HKORN_MEMBERSHIP_RENEWAL_smallwhitebg.png""
//             }
//         }
//     ]
// }"

// ignore_for_file: non_constant_identifier_names

class ProductData {
  final String name;
  final String description;
  final String regular_price;
  final String sale_price;
  final String price;
  final String image;

  const ProductData({
    required this.name,
    required this.description,
    required this.regular_price,
    required this.sale_price,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'regular_price': regular_price,
      'sale_price': sale_price,
      'price': price,
      'image': image,
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      name: map['name'] as String,
      description: map['description'] as String,
      regular_price: map['regular_price'] as String,
      sale_price: map['sale_price'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
    );
  }
}

class CartListModel {
  final String product_id;
  final ProductData product_data;

  Map<String, dynamic> toMap() {
    return {
      'product_id': product_id,
      'product_data': product_data,
    };
  }

  factory CartListModel.fromMap(Map<String, dynamic> map) {
    return CartListModel(
      product_id: map['product_id'] as String,
      product_data: ProductData.fromMap(map['product_data']),
    );
  }

  const CartListModel({
    required this.product_id,
    required this.product_data,
  });
}
