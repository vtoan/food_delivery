// import 'package:day2/screen/register.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/repositories/userRepo.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final phone = TextEditingController();
  final fullName = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  funcLogin() async {
    final strPhone = phone.text;
    final strFullName = fullName.text;
    final strAddress = address.text;
    final strPassword = password.text;
    final strConfirmPassword = confirmPassword.text;

    if ( strPhone != "" && strPassword == strConfirmPassword ) {
      var re = await UserRepo.signUp(new User(phone: strPhone, fullName:  strFullName, password: strPassword, address:  strAddress));
      if(re)
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text("Register success!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
      else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Fielded'),
                content: Text("Can't sign up."),
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
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid'),
              content: Text('Password and Confirm Password is not correct.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
        child:  Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,15),
                  child: TextField(
                    selectionWidthStyle: BoxWidthStyle.tight,
                    controller: fullName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'FullName'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,15),
                  child: TextField(
                    controller: address,
                    // maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Address'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,15),
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Phone'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,15),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,15),
                  child: TextField(
                    controller: confirmPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'ConfirmPassword'),
                  ),
                ),

                Container(
                  height: 50,
                  width: 150,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.primaries[0],
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    child: Text('Submit', style: TextStyle(fontSize: 16), ),
                    onPressed: () {
                      funcLogin();
                    },
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Have a account?'),
                      TextButton(

                        child: Text(
                          'Login',
                        ),
                        onPressed: () =>
                            Navigator.pop(context)
                        // funcRegister();
                        ,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}