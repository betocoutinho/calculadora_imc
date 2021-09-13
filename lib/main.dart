import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: "Calculadora IMC",
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe os seus dados!";
  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe os seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }
  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso Ideial (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obsesidade Grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obsesidade Grau II (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 40.0){
        _infoText = "Obsesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: _resetFields, icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.person_outline, size: 120.0, color: Colors.blueGrey),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.blueGrey)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                  controller: weightController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "insira o seu peso";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.blueGrey)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                  controller: heightController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "insira a sua altura";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _calculate();
                        }
                      },
                      child: Text("Calcular IMC"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.white, fontSize: 25.0))),
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}