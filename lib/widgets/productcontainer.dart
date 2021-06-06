import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/screens/details.dart';

class ProductContainer extends StatelessWidget {
  ProductContainer(this.product, Key key) : super(key: key);
  final Product product;
  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailsScreen(product, ObjectKey(product.id))),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$ ${product.price}",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black87,
                    ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '${product.id}',
                  child: Image.asset(
                    "${product.img}",
                    fit: BoxFit.cover,
                    // width: double.infinity,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(
                    Radius.circular(9.0),
                  ),
                ),
                child: Text("${product.title}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.apply(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
