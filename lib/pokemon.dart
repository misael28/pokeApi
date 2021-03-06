class Pokemon {
  String nome;
  String urlImage;
  List<Ability> abilities;

  Pokemon(this.nome,this.urlImage,this.abilities);

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];

    var arrayAbilities = json['abilities'] as List;
    abilities = arrayAbilities.map((item) {
      return Ability.fromJson(item['ability']);
    }).toList();
  }
}
class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}