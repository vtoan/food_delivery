import 'package:flutter/material.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/widgets/categorycontainer.dart';
import 'package:food_delivery/widgets/productcontainer.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 81,
            child: CategoryContainer(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Hamburger",
            style: Theme.of(context).textTheme.headline6?.apply(
                  fontWeightDelta: 2,
                ),
          ),
          SizedBox(
            height: 11,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: .7),
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductContainer(id: index);
            },
          )
        ],
      ),
    );
  }
}
