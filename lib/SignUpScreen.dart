import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miaged/NavigationBar/Pages/Homescreen.dart';

import 'Component.dart';
import 'NavigationBar/navbar.dart';
import 'Toast.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final emailcon = TextEditingController();
    final passwordcon = TextEditingController();
    final _formkey = GlobalKey<FormState>();
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
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 45,
                          ),
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
                          SizedBox(
                            height: 55,
                          ),
                          roundbutton(
                              title: "Sign Up.",
                              tapfun: () {
                                // if (_formkey.currentState!.validate()) {
                                print("press signup");
                                FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: emailcon.text.toString(),
                                    password: passwordcon.text.toString())
                                    .then((value) {
                                  print("suc");

                                  print("suc next scren");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavController()));
                                }).onError((error, stackTrace) {
                                  print("error");

                                  toastmessage(error.toString());
                                });
                              }),
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
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginscreen()));
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}