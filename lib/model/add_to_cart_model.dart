// To parse this JSON data, do
//
//     final addToCartDataModel = addToCartDataModelFromJson(jsonString);
import 'dart:convert';

AddToCartDataModel addToCartDataModelFromJson(String str) =>
    AddToCartDataModel.fromJson(json.decode(str));

String addToCartDataModelToJson(AddToCartDataModel data) =>
    json.encode(data.toJson());

class AddToCartDataModel {
  AddToCartDataModel({
    required this.cart,
  });

  Cart cart;

  factory AddToCartDataModel.fromJson(Map<String, dynamic> json) =>
      AddToCartDataModel(
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart.toJson(),
      };
}

class Cart {
  Cart({
    required this.the852C44Ddce7E0C7E4C64D86147300831,
  });

  The852C44Ddce7E0C7E4C64D86147300831 the852C44Ddce7E0C7E4C64D86147300831;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        the852C44Ddce7E0C7E4C64D86147300831:
            The852C44Ddce7E0C7E4C64D86147300831.fromJson(
                json["852c44ddce7e0c7e4c64d86147300831"]),
      );

  Map<String, dynamic> toJson() => {
        "852c44ddce7e0c7e4c64d86147300831":
            the852C44Ddce7E0C7E4C64D86147300831.toJson(),
      };
}

class The852C44Ddce7E0C7E4C64D86147300831 {
  The852C44Ddce7E0C7E4C64D86147300831({
    required this.key,
    required this.productId,
    required this.variationId,
    required this.variation,
    required this.quantity,
    required this.lineTaxData,
    required this.lineSubtotal,
    required this.lineSubtotalTax,
    required this.lineTotal,
    required this.lineTax,
  });

  String key;
  String productId;
  int variationId;
  List<dynamic> variation;
  String quantity;
  LineTaxData lineTaxData;
  String lineSubtotal;
  int lineSubtotalTax;
  String lineTotal;
  int lineTax;

  factory The852C44Ddce7E0C7E4C64D86147300831.fromJson(
          Map<String, dynamic> json) =>
      The852C44Ddce7E0C7E4C64D86147300831(
        key: json["key"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        quantity: json["quantity"],
        lineTaxData: LineTaxData.fromJson(json["line_tax_data"]),
        lineSubtotal: json["line_subtotal"],
        lineSubtotalTax: json["line_subtotal_tax"],
        lineTotal: json["line_total"],
        lineTax: json["line_tax"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "product_id": productId,
        "variation_id": variationId,
        "variation": List<dynamic>.from(variation.map((x) => x)),
        "quantity": quantity,
        "line_tax_data": lineTaxData.toJson(),
        "line_subtotal": lineSubtotal,
        "line_subtotal_tax": lineSubtotalTax,
        "line_total": lineTotal,
        "line_tax": lineTax,
      };
}

class LineTaxData {
  LineTaxData({
    required this.subtotal,
    required this.total,
  });

  List<dynamic> subtotal;
  List<dynamic> total;

  factory LineTaxData.fromJson(Map<String, dynamic> json) => LineTaxData(
        subtotal: List<dynamic>.from(json["subtotal"].map((x) => x)),
        total: List<dynamic>.from(json["total"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "subtotal": List<dynamic>.from(subtotal.map((x) => x)),
        "total": List<dynamic>.from(total.map((x) => x)),
      };
}
