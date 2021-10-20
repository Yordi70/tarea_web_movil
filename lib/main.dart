import 'package:flutter/material.dart';

import 'package:tarea_4/service_suma.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _numero1 = TextEditingController();
  TextEditingController _numero2 = TextEditingController();
  late int numero1;
  late int numero2;
  late int res;

  void convert() {
    numero1 = int.parse(_numero1.text);
    numero2 = int.parse(_numero2.text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _numero1,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Numero1',
                  ),

                  keyboardType:
                      TextInputType.number, //Mostrara teclado numérico
                ),
              ),
              Divider(),
              Container(
                child: TextField(
                  controller: _numero2,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Numero2',
                  ),

                  keyboardType:
                      TextInputType.number, //Mostrara teclado numérico
                ),
              ),
              Divider(),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () async {
                  convert();
                  res = await suma(numero1, numero2);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Resultado'),
                            content: Text(res.toString()),
                          ));
                },
                color: Colors.green,
                child: Text('Sumar', style: TextStyle(color: Colors.white)),
              ),
            ],
          )),
    );
  }
}
