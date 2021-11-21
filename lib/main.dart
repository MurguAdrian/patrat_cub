import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nrSchimb = new TextEditingController();
  String _raspuns = "";
  int ok =0;

  void _verif() {
    setState(() {
      for(int i = 0; i<= int.parse(_nrSchimb.text); i++)
      {
        int cube = i*i*i;
        if(cube == double.parse(_nrSchimb.text).toInt())
          ok = 1;
      }
      if((sqrt(double.parse(_nrSchimb.text)).toInt()) == sqrt(double.parse(_nrSchimb.text)) && ok == 1)
        _raspuns = "Ambele";
      else
      if ((sqrt(double.parse(_nrSchimb.text)).toInt()) == sqrt(double.parse(_nrSchimb.text)))
        _raspuns = "Este Patrat Perfect";
      else
      if(ok==1)
        _raspuns = "Este cub Perfect";
      else
        _raspuns = "Nu este nici Patrat nici Cub Perfect";
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text("Patrat sau Cub"),
          ),
        ),
        body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Tasteaza un numar pentru a vedea daca este Patrat perfect sau Cub Perfect',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _nrSchimb,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tasteaza Numarul'
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      _verif();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(_nrSchimb.text),
                          content: Text('$_raspuns'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Reincearca",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}