import 'package:flutter/material.dart';
import 'package:food_delivery/global.dart';
import 'package:food_delivery/repositories/userRepo.dart';


class UserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
          ),
          Align(
            child: SizedBox(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/img/user.png"),
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
                child:
                    Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(child: Text("${UserCurrent.userIdentity.fullName}", style: TextStyle(fontSize: 16)))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child:
                Text("Phone", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(child: Text("${UserCurrent.userIdentity.phone}", style: TextStyle(fontSize: 16)))
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
                child:
                Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Flexible(
                child: Text(
                  "${UserCurrent.userIdentity.address}",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 5,
            child: Container(
              padding: const EdgeInsets.only(bottom: 15.0),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Logout", style: Theme.of(context).textTheme.button
                    ?.apply(color: Colors.white),
                    ),
                onPressed: () {
                  UserRepo.signOut();
                  Navigator.pushReplacementNamed(context, "/");
                },
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
