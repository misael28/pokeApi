import 'dart:math';

import 'package:pokemon/pokemon.dart';

import 'dart:async';
import './poke_model.dart';

class PokeViewModel {
  final model = PokeModel();
  
  StreamController<Pokemon> streamPokemon = StreamController(); 

  loadPokemon(){
    model.fetchPokemon(Random().nextInt(1000));
    model.pokemon.then((value){
      streamPokemon.add(value);
    });
  }
}