import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  String username = "abc";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Align(
            child: SizedBox(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/img/hamburger_3.png"),
                backgroundColor: Colors.transparent,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text("Name"),
              ),
              SizedBox(
                child: Text("Dang Toan",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text("Phone"),
              ),
              SizedBox(
                child: Text("+84 0123 456 789",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text("Address"),
              ),
              Flexible(
                child: Text(
                  "123 Nguyen Tri Phuong, F8, Q.10, TP.HCM",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 4.5,
            child: Container(
              padding: const EdgeInsets.only(bottom: 15.0),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Logout", style: Theme.of(context).textTheme.button
                    // .apply(color: Colors.white),
                    ),
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
