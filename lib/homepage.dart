import 'package:flutter/material.dart';

import 'Pokemon.dart';
import 'adicionarPokemon.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);
  final String title;
  static const String routeName = "/";
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<Homepage> {

  List<Pokemon> pokemons;

  void _goToAdicionarPokemon() {
    Navigator.pushNamed(context, AdicionarPokemon.routeName);
  }

  @override 
  void initState(){
    super.initState();
    this.pokemons = getPokemons();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
       Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                child: Text('Adicionar Pokemon', style: TextStyle(fontSize: 20.0),),
                color: Colors.deepOrange[700],  
                textColor: Colors.white,  
              onPressed: _goToAdicionarPokemon,
              )),
              Expanded(
                child: ListView.separated( 
                padding: const EdgeInsets.all(16.0),
                itemCount: pokemons == null ? 0 : pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Pokemon: " + pokemons[index].nome),
                    subtitle: Text(
                      "Primario: " + pokemons[index].tipos[0]  +
                      "\n" +
                      "Secundario: " + pokemons[index].tipos[1]
                    )
                  );
                },
                separatorBuilder: (context, index) {
                    return Divider();
                },
              )
            )],
          ),
        )
      ),
    );
  }

}