import 'package:flutter/material.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/widgets/counter.dart';

class OrdersScreen extends StatelessWidget {
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
                  Text(
                    "My Order",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.apply(fontWeightDelta: 2, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ...List.generate(productsList.length, (id) {
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                "${productsList[id].img}",
                                width: 70,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              "${productsList[id].title}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              child: Counter(),
                            ),
                            trailing: Text(
                              "${productsList[id].price}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          );
                        }).toList(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ListTile(
                            leading: Container(
                              width: 70,
                              height: double.infinity,
                              // margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(Icons.dashboard),
                            ),
                            title: Text(
                              "Delivery",
                              style:
                                  Theme.of(context).textTheme.headline5?.apply(
                                        fontWeightDelta: 2,
                                      ),
                            ),
                            trailing: Text(
                              "\$5.99",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Confirm Payment",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.apply(color: Colors.white),
                      ),
                      onPressed: () {},
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
