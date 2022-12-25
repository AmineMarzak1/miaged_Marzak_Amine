import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged/Toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Component.dart';
import 'package:flutter/material.dart';

import '../../loginscreen.dart';

class Homescreenpage extends StatelessWidget {
  const Homescreenpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  _HomescreenState createState() => _HomescreenState();
}

// user10@gmail.com
class _HomescreenState extends State<Homescreen> {
  final Stream<QuerySnapshot> _homescreenStream = FirebaseFirestore.instance.collection('vetements').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _homescreenStream,
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
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  FirebaseFirestore.instance.collection('panier').add({
                    'marque': data['marque'],
                    'titre': data['titre'],
                    'taille': data['taille'],
                    'prix': data['prix'],
                    'image': data['image'],
                    'login': FirebaseAuth.instance.currentUser!.email,
                  });
                },
              ),
              //subtitle: Text(data['taille']),
              //subtitle: Text(data['prix']),
            );
          }).toList(),
        );
      },
    );
  }
}