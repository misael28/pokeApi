import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {

  final controller = PokeController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          FutureBuilder<Pokemon>(
            future: controller.pokemon,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data.nome, style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ));
              }
              return Container();
            },),
          ElevatedButton(onPressed: () {
            setState(() {
              controller.loadPokemon();
            });
            controller.loadPokemon();
          }, child: Text("Load Pokemon"))
        ]
      ),
    );
  }
}