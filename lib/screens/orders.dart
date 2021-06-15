import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/repositories/cartRepo.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreen createState() => _OrdersScreen();
}

class _OrdersScreen extends State<OrdersScreen> {
  late Future<List<ProductInCart>> _productInCarts = CartRepo.getCart();

  void onDelete(int productId) {
    CartRepo.removeItem(productId).then((value) => setState(() {
          _productInCarts = CartRepo.getCart();
          _productInCarts.then((value) => calTotal(value));
        }));
  }

  void onOrder() {
    CartRepo.clearCart().then((value) => updateData());
  }

  void updateData() {
    setState(() {
      _productInCarts = CartRepo.getCart();
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Order success'),
            actions: [
              TextButton(
                onPressed: () {
                  return Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  double calTotal(List<ProductInCart> carts) {
    var total = 0.0;
    carts.forEach((item) {
      total += (item.quantity * item.price);
    });
    return double.parse((total).toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                      title: Text(
                        "My Order",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.apply(fontWeightDelta: 2, color: Colors.black87),
                      ),
                      trailing: FutureBuilder<List<ProductInCart>>(
                        future: _productInCarts,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data;
                            return Text(
                              "\$ ${calTotal(data!)}",
                              style: Theme.of(context).textTheme.headline6,
                            );
                          } else {
                            return Text("${snapshot.error}");
                          }
                        },
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                      child: FutureBuilder<List<ProductInCart>>(
                    future: _productInCarts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        if (data == null) return Text("No data");
                        // calTotal(data);
                        return ListView(
                          children: <Widget>[
                            ...List.generate(data.length, (index) {
                              return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.asset(
                                      "${data[index].img}",
                                      width: 70,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  title: Text(
                                    "${data[index].title}",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                    ),
                                    child: Row(children: [
                                      Text("\$ ${data[index].price}"),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text("x"),
                                      ),
                                      Text(
                                        "${data[index].quantity}",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                  ),
                                  trailing: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      child: Text(
                                        "Remove",
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.apply(
                                              color: Colors.white,
                                            ),
                                      ),
                                      onPressed: () =>
                                          onDelete(data[index].id)));
                            }).toList(),
                          ],
                        );
                      } else {
                        return Text("${snapshot.error}");
                      }
                    },
                  )),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Order",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.apply(color: Colors.white),
                      ),
                      onPressed: () => onOrder(),
                      // color: Colors.green,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
