import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/repositories/cartRepo.dart';

class Counter extends StatefulWidget {
  final Product product;
  const Counter({required this.product});
  @override
  _CounterState createState() => _CounterState(product: product);
}

class _CounterState extends State<Counter> {
  int _count = 1;
  final Product product;
  _CounterState({required this.product});

  void addToCart() {
    CartRepo.addItem(product, _count);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Add product to cart success.'),
            actions: [
              TextButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _count += 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.add),
          ),
        ),
        SizedBox(width: 15.0),
        Text("$_count"),
        SizedBox(width: 15.0),
        GestureDetector(
          onTap: () {
            setState(() {
              _count -= 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.remove),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: ElevatedButton(
            child: Text(
              "Add To Cart",
              style: Theme.of(context).textTheme.button?.apply(
                    color: Colors.white,
                  ),
            ),
            onPressed: () => addToCart(),
          ),
        )
      ],
    );
  }
}
