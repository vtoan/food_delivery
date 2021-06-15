import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/repositories/favoriteRepo.dart';

class ProductRepo {

  static final productsRef = FirebaseFirestore.instance.collection('products').withConverter<Product>(
    fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
    toFirestore: (p, _) => p.toJson(),
  );

  static Future<List<Product>> getProductFavorite() async {
    List<int> favoriates = await  FavoriteRepo.getFavorite();
    if(favoriates.isEmpty) return [];
    final querySnapshot = await productsRef.where("id", whereIn: favoriates).get();
    List<Product> products = querySnapshot.docs.map((doc) => doc.data()).toList();
    return products;
  }

  static Future<List<Product>> getList(int? cateId) async {
    final querySnapshot = await productsRef.where("categoryId",isEqualTo: cateId).get();
    List<Product> products = querySnapshot.docs.map((doc) => doc.data()).toList();
    return products;
  }

  static Future<Product> getById(int id) async {
    final querySnapshot = await productsRef.doc(id.toString()).get();
    Product product = querySnapshot.data() ?? new Product();
    return product;
  }

  static Future<void > intial() async{
    for(var i = 0; i< productsList.length;i++) {
      await productsRef.doc(productsList[i].id.toString()).set(productsList[i]);
    }
  }
}
