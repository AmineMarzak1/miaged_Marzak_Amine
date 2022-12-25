import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged/Toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Component.dart';
import 'package:flutter/material.dart';

import '../../loginscreen.dart';

class Panierpage extends StatelessWidget {
  const Panierpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: new Column(
          children: <Widget>[
            Panier(),
            new Text("total général du panier :"),
          ]
      )


    );
  }
}

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);
  @override
  _PanierState createState() => _PanierState();
}

// user10@gmail.com
class _PanierState extends State<Panier> {
  final Stream<QuerySnapshot> _panierStream = FirebaseFirestore.instance.collection('panier').where('login', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    int _prixtotalpanier = 0;
    int addTotalPrice(int prix) {
      _prixtotalpanier = _prixtotalpanier + prix;
      return _prixtotalpanier;
    }
    return StreamBuilder<QuerySnapshot>(
      stream: _panierStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children:  [
                              SizedBox(
                                width: 100,
                                child: Image.network(data['image']),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data['titre']),
                                      Text(data['taille']),
                                      Text(data['prix'].toString() + "€"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('panier').doc(document.id).delete();
                                    _prixtotalpanier = 0;
                                  },
                                ),
                              ), //supprimer produit du panier
                            ],
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Text("totale général" + addTotalPrice(data['prix']).toString() + "€"),
                        ],
                     ),
                  ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}