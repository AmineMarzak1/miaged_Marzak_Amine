import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'Component.dart';
import 'Toast.dart';
import 'navbar.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => new _ProfilState();
}


enum Groups { groupe1, groupe2}
class _ProfilState extends State<Profil> {

  bool isChecked1 = false;
  bool isChecked2 = false;
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

