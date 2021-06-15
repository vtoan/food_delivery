import 'package:flutter/material.dart';

class Category {
  int id;
  String title;
  String icon;

  Category({this.id = 0, this.title = "", this.icon = ""});

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      icon: json['icon'] ?? "",
    );
  }
}
