import 'dart:ffi';

class Product {
  int id;
  String title = '';
  String description = '';
  String img = '';
  double price = 0;
  int categoryId =0;

  Product(
      {this.id = 0,
      this.title: '',
      this.description: '',
      this.price: 0,
      this.img: '',
      this.categoryId :0});

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'img': img,
      'categoryId' :categoryId
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      img: json['img'] ?? "",
    );
  }
}
