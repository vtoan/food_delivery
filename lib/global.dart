import 'models/category.dart';
import 'models/product.dart';
import 'models/user.dart';

class UserCurrent {
  static User userIdentity = new User();
}

String lorem =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas at, aspernatur blanditiis veritatis nam ea corrupti architecto";

List<Product> productsList = [
  Product(
      id: 1,
      description:
          "Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.",
      title: "Burger Bò miếng lớn",
      price: 3.00,
      img: "assets/img/hamburger.png",
      categoryId: 1),
  Product(
      id: 2,
      description:
          "Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.",
      title: "Burger 2 lớp bò",
      price: 4.93,
      img: "assets/img/hamburger_1.png",
      categoryId: 1),
  Product(
      id: 3,
      description:
          "Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.",
      title: "Burger Big Mac",
      price: 6.99,
      img: "assets/img/hamburger_2.png",
      categoryId: 1),
  Product(
      id: 4,
      description:
          "Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.",
      title: "Burger Bò Hoàng Gia",
      price: 8.99,
      img: "assets/img/hamburger_3.png",
      categoryId: 1),
  //
  Product(
      id: 5,
      description:
          "Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.",
      title: "Caramel Macchiato",
      price: 4.99,
      img: "assets/img/coffee-01.png",
      categoryId: 2),
  Product(
      id: 6,
      description:
          "Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.",
      title: "Mocha Macchiato",
      price: 3.40,
      img: "assets/img/coffee-02.png",
      categoryId: 2),
  Product(
      id: 7,
      description:
          "Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.",
      title: "Latte",
      price: 4.00,
      img: "assets/img/coffee-03.png",
      categoryId: 2),
  Product(
      id: 8,
      description:
          "Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.",
      title: "Americano",
      price: 3.99,
      img: "assets/img/coffee-04.png",
      categoryId: 2),
  Product(
      id: 9,
      description:
          "Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào.",
      title: "Espresso",
      price: 2.99,
      img: "assets/img/coffee-05.png",
      categoryId: 2),
  //
  Product(
      id: 10,
      description: "Bánh Mousse Ca Cao, là sự kết hợp giữa ca-cao Việt Nam đậm đà cùng kem tươi",
      title: "Mousse Ca Cao",
      price: 4.00,
      img: "assets/img/cake-01.png",
      categoryId: 3),
  Product(
      id: 11,
      description:"Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.",
      title: "Mousse Đào",
      price: 3.99,
      img: "assets/img/cake-02.png",
      categoryId: 3),
  Product(
      id: 12,
      description:"Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.",
      title: "So-co-la Highlands",
      price: 4.99,
      img: "assets/img/cake-03.png",
      categoryId: 3)
];

List<Category> cats = [
  Category(
    id: 1,
    icon: "assets/icons/burger.png",
    title: "Hamburger",
  ),
  Category(
    id: 2,
    icon: "assets/icons/coffee.png",
    title: "Coffee",
  ),
  Category(
    id: 3,
    icon: "assets/icons/cake.png",
    title: "Cake",
  ),
];
