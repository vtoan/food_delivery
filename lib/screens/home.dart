import 'package:flutter/material.dart';
import 'package:food_delivery/screens/favorite.dart';
import 'package:food_delivery/screens/food.dart';
import 'package:food_delivery/screens/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  //child screen
  final List<Widget> _children = [FoodScreen(), FavoriteScreen(), UserScreen()];
  //handle event
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red[400],
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Person",
          ),
        ],
      ),
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Color(0xfff9f9f9),
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Food",
              style: Theme.of(context).textTheme.headline4?.apply(
                    fontWeightDelta: 2,
                    color: Colors.red[400],
                  ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text("Delivery",
                  style: Theme.of(context).textTheme.headline6?.apply()),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () => Navigator.pushNamed(context, 'orderscreen'),
          ),
        ],
      ),
    );
  }
}
