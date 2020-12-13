class Pokemon {
  String nome;
  List<String> tipos;

  Pokemon(String nome, List<String> tipos){
    this.nome = nome;
    this.tipos = tipos;
  }
}

List<Pokemon>pokemons = [];

adicionarPokemons(Pokemon pokemon){
  pokemons.add(pokemon);
}

List<Pokemon> getPokemons(){
  return pokemons;
}