import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Component.dart';

import 'package:flutter/material.dart';

import 'Forgetpassword.dart';
import 'NavigationBar/Pages/Homescreen.dart';
import 'SignUpScreen.dart';
import 'NavigationBar/navbar.dart';
import 'Toast.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool loading = false;
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF01737C),//Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                color: bcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "MIAGED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.4,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ), //login
                          SizedBox(
                            height: 45,
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailcon,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email),
                                      hintText: "Email",
                                    )),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passwordcon,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.password_sharp),
                                    hintText: "Password",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                forgetpassword()));
                                  },
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          roundbutton(
                              title: "Login",
                              tapfun: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: emailcon.text.toString(),
                                    password: passwordcon.text.toString())
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavController()));
                                }).onError((error, stackTrace) {
                                  toastmessage(error.toString());
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          Text("- OR -"),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpScreen()));
                      },
                      child: Text("Sign Up")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}