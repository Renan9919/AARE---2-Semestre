import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/homepage.dart';

import 'Pokemon.dart';

class AdicionarPokemon extends StatefulWidget {
  AdicionarPokemon({Key key, this.title}) : super(key: key);

  static const String routeName = "/adicionarPokemon";

  final String title;

  @override 
  _AdicionarPokemonState createState() => new _AdicionarPokemonState();
}

class _AdicionarPokemonState extends State<AdicionarPokemon> {

  List<ListItem> _dropdownItems = [
    ListItem(1, ""),
    ListItem(2, "Normal"),
    ListItem(3, "Lutador"),
    ListItem(4, "Voador"),
    ListItem(5, "Veneno"),
    ListItem(6, "Terrestre"),
    ListItem(7, "Pedra"),
    ListItem(8, "Inseto"),
    ListItem(9, "Aço"),
    ListItem(10, "Fantasma"),
    ListItem(11, "Fogo"),
    ListItem(12, "Água"),
    ListItem(13, "Grama"),
    ListItem(14, "Elétrico"),
    ListItem(15, "Psíquico"),
    ListItem(16, "Gelo"),
    ListItem(17, "Dragão"),
    ListItem(18, "Noturno"),
    ListItem(19, "Fada"),
    
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _pokemonTipoPrimario;
  ListItem _pokemonTipoSecundario;
  String _nomePokemon;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _pokemonTipoPrimario = _dropdownMenuItems[0].value;
    _pokemonTipoSecundario =  _dropdownMenuItems[0].value;
  }

  void _adicionarPokemon(){
    adicionarPokemons(new Pokemon(_nomePokemon, [_pokemonTipoPrimario.name, _pokemonTipoSecundario.name]));
    Navigator.pushNamed(context, Homepage.routeName);
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {  
    List<DropdownMenuItem<ListItem>> items = List();  
    for (ListItem listItem in listItems) {  
      items.add(  
        DropdownMenuItem(  
          child: Text(listItem.name),  
          value: listItem,  
        ),  
      );  
    }  
    return items;  
  }  

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome do Pokemon',
                    labelText: 'Nome do Pokemon',
                  ),
                  onChanged: (value){
                    _nomePokemon = value;
                  }, 
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O nome do pokemon deve ser informado';
                    }
                    return null;
                  },
                ),
                DropdownButton(
                  value: _pokemonTipoPrimario,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _pokemonTipoPrimario = value;
                    });
                  }
                ),
                DropdownButton(
                  value: _pokemonTipoSecundario,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _pokemonTipoSecundario = value;
                    });
                  }
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                  child: Text('Adicionar novo Pokemon', style: TextStyle(fontSize: 20.0),),
                  color: Colors.deepOrange[700],  
                  textColor: Colors.white,  
                onPressed: () => _adicionarPokemon() 
                )
              )
            ],)  
          ),
        )
      );
    }

}

class ListItem {  
  int value;  
  String name;  
  
  ListItem(this.value, this.name);  
}  