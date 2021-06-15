import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/category.dart';

class CategoryRepo {

  static final categoriesRef = FirebaseFirestore.instance.collection('categories').withConverter<Category>(
    fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
    toFirestore: (p, _) => p.toJson(),
  );

  static Future<List<Category>> getList() async {
    final querySnapshot = await categoriesRef.get();
    List<Category> categories = querySnapshot.docs.map((doc) => doc.data()).toList();
    return categories;
  }

  static Future<void > intial() async{
    for(var i = 0; i< cats.length;i++) {
      await categoriesRef.doc(cats[i].id.toString()).set(cats[i]);
    }
  }
}
