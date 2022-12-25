import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Component.dart';
import '../../Toast.dart';
import '../navbar.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
  @override
  _ProfilState createState() => new _ProfilState();
}

enum Groups { groupe1, groupe2}

class _ProfilState extends State<Profil> {
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final posterController = TextEditingController();
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.white30, width: 1.5),
              ),
              title: Row(
                children: [
                  const Text('Nom: '),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: nameController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.white30, width: 1.5),
              ),
              title: Row(
                children: [
                  const Text('Année: '),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: yearController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.white30, width: 1.5),
              ),
              title: Row(
                children: [
                  const Text('Poster: '),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: posterController,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                FirebaseFirestore.instance.collection('Movies').add({
                  'name': nameController.value.text,
                  'year': yearController.value.text,
                  'poster': posterController.value.text,
                });
              },
              child: const Text('Ajouterr'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _ProfilState extends State<Profil> {
  String _value = 'Mon profile';
  String _valueq1 = 'Entrer votre date d anniverssaire';
  String _valueq2 = '   Parmi ces langages lesquels vous maitrisez?';

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    if (picked != null) setState(() => _valueq1 = picked.toString());
  }

  @override
  static const String _title = 'Mon profile';
  Groups? _character = Groups.groupe1;
  // user10@gmail.com
  Widget build(BuildContext context) {

    final logindb = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: bcolor,
            automaticallyImplyLeading: false,
            title: const Text(_title)),
        body: new ListView(
            padding: new EdgeInsets.all(32.0),
            //child: new Column(
            children: <Widget>[
              new TextField(
                controller: logindb,
                decoration: new InputDecoration(
                  labelText: 'Login',
                  hintText: 'Enter your user name',
                  icon: new Icon(Icons.person),
                ),
              ), // login
              new TextField(
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your pwd',
                  icon: new Icon(Icons.password),
                ),
              ), // pwd
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Anniverssaire',
                  hintText: _valueq1,
                  icon: new Icon(Icons.cake),
                ),
              ), // anniv
              new ElevatedButton(onPressed: _selectDate, child: new Text('Date d''anniverssaire'),),
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Addresse',
                  hintText: 'Entrer votre addresse',
                  icon: new Icon(Icons.roofing),
                ),
              ), // addresse
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Code postale',
                  hintText: 'Entrer votre code postale',
                  icon: new Icon(Icons.local_post_office_outlined),
                ),
              ), // code postale
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Ville',
                  hintText: 'Entrer votre ville',
                  icon: new Icon(Icons.location_city),
                ),
              ), // ville
              SizedBox(
                height: 55,
              ),
              ElevatedButton(
                  onPressed: (){
                    Map<String,String> dataTatoSave={
                      'login': logindb.text,
                    };
                    FirebaseFirestore.instance.collection('users').add(dataTatoSave);
                  },
                  child: Text('Valider')),

              roundbutton(
                  title: "Valider",
                  tapfun: () {

                  }),
            ]
          // )
        )
    );
  }
}
*/
