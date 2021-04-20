import 'package:pokemon/pokemon.dart';

import './poke_model.dart';

class PokeController {
  final model = PokeModel();
  int number = 0;

  Future<Pokemon> get pokemon => model.pokemon;
  
  loadPokemon(){
    model.fetchPokemon(number++);
  }
}