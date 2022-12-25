import 'package:flutter/material.dart';
import 'package:miaged/NavigationBar/Pages/panier.dart';
import 'package:miaged/loginscreen.dart';
import 'package:miaged/NavigationBar/Pages/Homescreen.dart';
import 'package:miaged/NavigationBar/Pages/profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Component.dart';


class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    Homescreen(),
    Panier(),
    Profil(),

  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bcolor,
        automaticallyImplyLeading: false,
        title: Text(" MIAGED  "),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginscreen()));
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(msg: error.toString());
              });
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: bcolor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Acheter",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Panier",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}