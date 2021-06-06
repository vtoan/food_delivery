import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/product.dart';

String lorem =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas at, aspernatur blanditiis veritatis nam ea corrupti architecto";

List<Product> productsList = [
  Product(
    id: 1,
    description: lorem,
    title: "Bread 1",
    price: 8.00,
    img: "assets/img/bm_xiu_mai.png",
  ),
  Product(
    id: 2,
    description: lorem,
    title: "Bread 2",
    price: 5.93,
    img: "assets/img/bm_thit_nuong.png",
  ),
  Product(
    id: 3,
    description: lorem,
    title: "Hamburger 1",
    price: 6.99,
    img: "assets/img/hamburger.png",
  ),
  Product(
    id: 4,
    description: lorem,
    title: "Hamburger 2",
    price: 8.99,
    img: "assets/img/hamburger_1.png",
  ),
  Product(
      id: 5,
      description: lorem,
      title: "Hamburger 3",
      price: 8.99,
      img: "assets/img/hamburger_2.png"),
];

List<Category> cats = [
  Category(
    icon: "assets/icons/coffee.png",
    title: "Hamburger",
  ),
  Category(
    icon: "assets/icons/coffee.png",
    title: "Coffee",
  ),
  Category(
    icon: "assets/icons/coffee.png",
    title: "Tea",
  ),
];
