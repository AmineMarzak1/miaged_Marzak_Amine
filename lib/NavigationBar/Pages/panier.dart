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
      body: Panier(),
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
    return StreamBuilder<QuerySnapshot>(
      stream: _panierStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Image.network(data['image']),
              title: Text(data['marque']),
              subtitle: Text(data['titre'] +"   taille : " + data['taille'] +"    prix : " + data['prix'].toString() +"€"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  FirebaseFirestore.instance.collection('panier').doc(document.id).delete();
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}