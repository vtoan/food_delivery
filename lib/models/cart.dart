import 'dart:ffi';

import 'package:food_delivery/models/product.dart';

class ProductInCart {
  int id = 0;
  String title = '';
  String img = '';
  double price = 0;
  int quantity = 0;

  ProductInCart({
    this.id = 0,
    this.title: '',
    this.price: 0,
    this.img: '',
    this.quantity: 0,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'img': img,
      'quantity': quantity
    };
  }

  factory ProductInCart.fromProduct(Product product) {
    return ProductInCart(
      id: product.id,
      title: product.title,
      price: product.price,
      img: product.img,
    );
  }

  factory ProductInCart.fromJson(Map<String, dynamic> json) {
    return ProductInCart(
        id: json['id'] ?? 0,
        title: json['title'] ?? "",
        price: (json['price'] ?? 0).toDouble(),
        img: json['img'] ?? "",
        quantity: json['quantity'] ?? 0);
  }
}
