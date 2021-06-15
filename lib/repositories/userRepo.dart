import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user.dart';

class UserRepo {
  static final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (p, _) => p.toJson(),
          );
  //

  static Future<bool> signIn(phone, password) async {
    final querySnapshot = await usersRef.doc(phone.toString()).get();
    if (querySnapshot.exists) {
      UserCurrent.userIdentity = querySnapshot.data() ?? new User();
      return true;
    }
    return false;
  }

  static void signOut() async {
      UserCurrent.userIdentity = new User();
  }

  static Future<bool> signUp(User user) async {
    final itemRef = usersRef.doc(user.phone.toString());
    final querySnapshot = await itemRef.get();
    if (querySnapshot.exists)
      return false;
    await itemRef.set(user);
    UserCurrent.userIdentity = user;
    return true;
  }

  static Future<User> getUser(String phone) async {
    final querySnapshot = await usersRef.doc(phone.toString()).get();
    if (querySnapshot.exists)
      return querySnapshot.data() ??  new User();
    return new User();
  }
  //

}
