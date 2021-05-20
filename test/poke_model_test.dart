import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/api.dart';
import 'package:pokemon/poke_model.dart';
import 'package:pokemon/pokemon.dart';

void main(){

  test('Fetch pokemon should fill pokemon variable', (){
    final model = PokeModel(api: MockAPI());

    model.fetchPokemon(1);

    expect(model.pokemon, completion(isNotNull));

    model.pokemon.then((pokemon) {
      expect(pokemon.nome,'nome');
    });
  });

}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number){
    final pokemon = Pokemon('nome','urlimage',[]);
    return Future.value(pokemon);
  }
}