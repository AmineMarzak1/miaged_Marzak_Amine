import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged/Toast.dart';

import 'Component.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class Homescreen extends StatefulWidget {

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Text(
                  "Welcome to Home Screen",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: bcolor),
                ),
              ),
            ),
          ],
        ),
      );
    }
}