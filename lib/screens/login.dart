// import 'package:day2/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/repositories/userRepo.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phone = TextEditingController();
  final password = TextEditingController();

  funcLogin() async {
    final strPhone = phone.text;
    final strPassword = password.text;
    if (strPhone != "" && strPassword != "") {
      var re = await UserRepo.signIn(strPhone, strPassword);
      if (re)
        Navigator.pushReplacementNamed(context, 'home');
      else
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Fielded'),
                content: Text("Can't sign in."),
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
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Phone or Password is not correct.'),
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

  funcRegister() {
    return Navigator.pushNamed(context, 'register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: TextField(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Phone'),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 35),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
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
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    funcLogin();
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    TextButton(
                      child: Text(
                        'Register',
                      ),
                      onPressed: () {
                        funcRegister();
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            ],
          )),
    );
  }
}
