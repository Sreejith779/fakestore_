// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  int? id;
  int? userId;
  DateTime? date;
  List<Product>? products;
  int? v;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    userId: json["userId"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date?.toIso8601String(),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "__v": v,
  };
}

class Product {
  int? productId;
  int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
