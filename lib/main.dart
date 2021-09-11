import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(title: "Calculadora IMC",
    home: Home(),));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Icon(Icons.person_outline, size: 120.0, color: Colors.blueGrey),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (KG)",
              labelStyle: TextStyle(color: Colors.blueGrey)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.blueGrey)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
