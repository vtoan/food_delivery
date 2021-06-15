import 'package:flutter/material.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/repositories/productRepo.dart';
import 'package:food_delivery/repositories/favoriteRepo.dart';
import 'package:food_delivery/widgets/productcontainer.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  late Future<List<Product>> _products = ProductRepo.getProductFavorite();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _products = ProductRepo.getProductFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            "Your Favorite",
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

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //       padding: const EdgeInsets.symmetric(horizontal: 15),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             "Your Favorite",
  //             style: Theme.of(context).textTheme.headline6?.apply(
  //                   fontWeightDelta: 2,
  //                 ),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           GridView.builder(
  //             scrollDirection: Axis.vertical,
  //             shrinkWrap: true,
  //             physics: NeverScrollableScrollPhysics(),
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 2,
  //                 crossAxisSpacing: 15,
  //                 mainAxisSpacing: 15,
  //                 childAspectRatio: .7),
  //             itemCount: productsList.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return ProductContainer(productsList[index], ObjectKey(index));
  //             },
  //           )
  //         ],
  //       ));
  // }
}
