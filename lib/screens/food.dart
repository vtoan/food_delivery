import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/repositories/productRepo.dart';
import 'package:food_delivery/widgets/categorycontainer.dart';
import 'package:food_delivery/widgets/productcontainer.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreen createState() => _FoodScreen();
}

class _FoodScreen extends State<FoodScreen> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    onChangeCate();
  }

  void onChangeCate({int cateId = 1}) {
    setState(() {
      _products = ProductRepo.getList(cateId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   height: 10,
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     fillColor: Colors.white,
          //     filled: true,
          //     border: InputBorder.none,
          //     prefixIcon: Icon(Icons.search),
          //     hintText: "Search",
          //   ),
          // ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 81,
            child: CategoryContainer(onChanged: (i) => onChangeCate(cateId: i)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Products",
            style: Theme.of(context).textTheme.headline6?.apply(
                  fontWeightDelta: 2,
                ),
          ),
          SizedBox(
            height: 11,
          ),
          FutureBuilder<List<Product>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data == null) return Text("No data");
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: .7),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductContainer(
                          data[index], ObjectKey(index));
                    },
                  );
                } else {
                  return Text("${snapshot.error}");
                }
              })
        ],
      ),
    );
  }
}
