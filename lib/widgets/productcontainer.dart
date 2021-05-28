import 'package:flutter/material.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/screens/details.dart';

class ProductContainer extends StatelessWidget {
  final int id;

  void onDrag(DragEndDetails) {}

  const ProductContainer({var key, this.id: 0}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen(id: id)),
      ),
      onHorizontalDragEnd: onDrag,
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
              child: Text("\$ ${productsList[id].price}",
                  style: Theme.of(context).textTheme.headline6
                  // .copyWith(
                  //       color: Colors.black87,
                  //     ),
                  ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '$id',
                  child: Image.asset(
                    "${productsList[id].img}",
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
                child: Text("${productsList[id].title}",
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
