import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/product.dart';

class CartRepo {

  static final usersRef = FirebaseFirestore.instance.collection('users');
  //
  static CollectionReference<ProductInCart> getCartRef(String? userId) {
    var userIdentity = userId ?? UserCurrent.userIdentity.phone;
    return usersRef.doc(userIdentity).collection("cart").withConverter<ProductInCart>(
      fromFirestore: (snapshot, _) => ProductInCart.fromJson(snapshot.data()!),
      toFirestore: (p, _) => p.toJson(),
    );
  }

  static Future<List<ProductInCart>> getCart([String? userId]) async {
    final querySnapshot = await getCartRef(userId).get();
    List<ProductInCart> carts = querySnapshot.docs.map((doc) => doc.data()).toList();
    return carts;
  }

  static Future<void> addItem(Product product, int quantity, [String? userId]) async{
    final cartRef = getCartRef(userId);
    final cartItemRef = cartRef.doc(product.id.toString());
    final querySnapshot = await cartItemRef.get();
    if(querySnapshot.exists){
      int currentQuantity = querySnapshot.data()?.quantity ?? 0;
      await cartItemRef.update({"quantity":currentQuantity+quantity});
    }
    else{
      ProductInCart productInCart = ProductInCart.fromProduct(product);
      productInCart.quantity=quantity;
      await cartItemRef.set(productInCart);
    }
  }

  static Future<void> removeItem(int productId, [String? userId]) async{
    final cartRef = getCartRef(userId);
    final cartItemRef = cartRef.doc(productId.toString());
    await  cartItemRef.delete();
  }

  static Future<void> clearCart([String? userId]) async{
    final querySnapshot = await getCartRef(userId).get();
    final cartItems = querySnapshot.docs;
    for(var i =0 ; i<  cartItems.length; i++){
      await cartItems[i].reference.delete();
    }
  }

  // static Future<Product> signIn(int id) async {
  //   final querySnapshot = await productsRef.doc(id.toString()).get();
  //   Product product = querySnapshot.data() ?? new Product();
  //   return product;
  // }
  //
  
}
