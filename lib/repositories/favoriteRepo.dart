import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/product.dart';

class FavoriteRepo {
  static final usersRef = FirebaseFirestore.instance.collection('users');
  //
  static CollectionReference<Map<String, dynamic>> getFavoriteRef(
      String? userId) {
    var userIdentity = userId ?? UserCurrent.userIdentity.phone;
    return usersRef.doc(userIdentity).collection("favorites");
  }

  static Future<void> setFavorite(int productId, [String? userId]) async {
    final favoriteRef = getFavoriteRef(userId);
    final favoriteItemRef = favoriteRef.doc(productId.toString());
    final querySnapshot = await favoriteItemRef.get();
    if (querySnapshot.exists)
      await favoriteItemRef.delete();
    else
      await favoriteItemRef.set({"productId": productId});
  }

  static Future<List<int>> getFavorite([String? userId]) async {
    final favoriteItemRef = await getFavoriteRef(userId).get();
    final data = favoriteItemRef.docs.map((doc) => int.parse(doc.id)).toList();
    return data;
  }

  static Future<bool> checkFavorite(int productId, [String? userId]) async {
    final favoriteRef = getFavoriteRef(userId);
    final favoriteItemRef = favoriteRef.doc(productId.toString());
    final querySnapshot = await favoriteItemRef.get();
    return querySnapshot.exists;
  }

  // static Future<Product> signIn(int id) async {
  //   final querySnapshot = await productsRef.doc(id.toString()).get();
  //   Product product = querySnapshot.data() ?? new Product();
  //   return product;
  // }
  //

}
