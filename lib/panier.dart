import 'package:flutter/material.dart';

class Panier extends StatefulWidget {
  @override
  _PanierState createState() => new _PanierState();
}


enum Groups { groupe1, groupe2}
class _PanierState extends State<Panier> {

  bool isChecked1 = false;
  bool isChecked2 = false;
  String _value = 'renseignez le formulaire!';
  String _valueq1 = '   Choisissez la ville où vous voulez travailler:';
  String _valueq2 = '   Parmi ces langages lesquels vous maitrisez?';

  @override
  static const String _title = 'first application';
  Groups? _character = Groups.groupe1;

  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
            padding: new EdgeInsets.all(32.0),
            //child: new Column(
            children: <Widget>[
              new Text(_value),
              new Text(_valueq1),
              ListTile(
                title: const Text('Rabat'),
                leading: Radio<Groups>(
                  value: Groups.groupe1,
                  groupValue: _character,
                  onChanged: (Groups?value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Casablanca'),
                leading: Radio<Groups>(
                  value: Groups.groupe2,
                  groupValue: _character,
                  onChanged: (Groups?value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              new Text(_valueq2),
              new CheckboxListTile(
                value: isChecked1,
                onChanged: (bool? value){
                  setState(() {
                    isChecked1 = value!;});
                },
                title:
                new Text('C++'),
                controlAffinity:
                ListTileControlAffinity.leading,
                subtitle:
                new Text ('Subtitle'),
                secondary:
                new Icon(Icons.archive),
                activeColor:
                Colors.red,
              ),
              new CheckboxListTile(
                value: isChecked2,
                onChanged: (bool? value){
                  setState(() {
                    isChecked2 = value!;});
                },
                title:
                new Text('Java'),
                controlAffinity:
                ListTileControlAffinity.leading,
                subtitle:
                new Text ('Subtitle'),
                secondary:
                new Icon(Icons.archive),
                activeColor:
                Colors.green,
              ),
            ]
          // )
        )
    );
  }
}

