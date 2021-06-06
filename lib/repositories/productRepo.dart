import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/product.dart';

class ProductRepo {
  Future<List<Product>> getList(int? cateId) async {
    // final data = await rootBundle.load(path);
    // final bytes = data.buffer.asUint8List();

    return productsList;
  }

  Future<Product> getById(int id) async {
    // final data = await rootBundle.load(path);
    // final bytes = data.buffer.asUint8List();
    var p = productsList.firstWhere((element) => element.id == id);
    return p;
  }
}
