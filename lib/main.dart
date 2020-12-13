import 'package:flutter/material.dart';
import 'package:prova/adicionarPokemon.dart';

import 'homepage.dart';
import 'adicionarPokemon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.deepOrange[700]
      ),
      routes: <String, WidgetBuilder>{
        AdicionarPokemon.routeName: (BuildContext context) => new AdicionarPokemon(title: "Adicionar Pokemon"),
      },
      
      home: Homepage(title: 'AARE - sub')
    );
  }
}