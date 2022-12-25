import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profilpage extends StatelessWidget {
  const Profilpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: Profil(),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
  @override
  _ProfilState createState() => new _ProfilState();
}

class _ProfilState extends State<Profil> {
  final Stream<QuerySnapshot> _profilStream = FirebaseFirestore.instance.collection('users').where('login', isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots();

  String _valueq1 = 'date d anniverssaire';
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    if (picked != null) setState(() => _valueq1 = picked.toString());
  }
  void addLike(String docID, int likes) {
    var newLiks = likes + 1;
    try {
      FirebaseFirestore.instance.collection('users').doc(docID).update(
          {'likes': newLiks,}).then((value) {
        print('Base Firestore à jour');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final adresseController = TextEditingController();
  final villeController = TextEditingController();
  final codepostalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _profilStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading"),
          );
        }
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> datap = document.data()! as Map<String,
                dynamic>;
            return ListView(
                shrinkWrap: true,
                padding: new EdgeInsets.all(32.0),
                //child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: loginController,
                    decoration: new InputDecoration(
                      labelText: 'Login',
                      hintText: datap['login'],
                      icon: new Icon(Icons.person),
                    ),
                  ), //login
                  new TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: new InputDecoration(
                      labelText: 'Password',
                      hintText: datap['paSsword'],
                      icon: new Icon(Icons.password),
                    ),
                  ), // pwd
                  new TextField(
                    decoration: new InputDecoration(
                      labelText: 'Anniverssaire',
                      hintText: datap['anniv'].toString(),
                      icon: new Icon(Icons.cake),
                    ),
                  ), // anniv
                  new ElevatedButton(onPressed: _selectDate, child: new Text('Date d''anniverssaire'),),
                  new TextField(
                    controller: adresseController,
                    decoration: new InputDecoration(
                      labelText: 'Adresse',
                      hintText: datap['adresse'],
                      icon: new Icon(Icons.home),
                    ),
                  ), // addresse
                  new TextField(
                    controller: codepostalController,
                    decoration: new InputDecoration(
                      labelText: 'Code postal',
                      hintText: datap['code postal'].toString(),
                      icon: new Icon(Icons.local_post_office),
                    ),
                  ), // code postal
                  new TextField(
                    controller: villeController,
                    decoration: new InputDecoration(
                      labelText: 'Ville',
                      hintText: datap['ville'],
                      icon: new Icon(Icons.location_city),
                    ),
                  ), // ville
                  SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance.collection('users').doc(document.id).update(
                            {'login': loginController.text, 'paSsword': passwordController.text, 'adresse': adresseController.text, 'code postal': int.parse(codepostalController.text), 'ville': villeController.text, 'anniv': _valueq1,}).then((value) {
                          print('Base Firestore à jour');
                        });
                      }, child: Text('Valider'),
                  )
                ]
            );
          }).toList(),
        );
      },
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
