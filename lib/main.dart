import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:shop_delivery/ui/screens/details.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/screens/orders.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: HomeScreen(),
      routes: {
        'orderscreen': (ctx) => OrdersScreen(),
      },
    );
  }
}
