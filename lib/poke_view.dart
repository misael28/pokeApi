import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {

  final viewModel = PokeViewModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          StreamBuilder<Pokemon>(
            stream: viewModel.streamPokemon.stream,
            builder: (context, snapshot){
              if(snapshot.connectionState != ConnectionState.active){
                return CircularProgressIndicator();
              }

              if(snapshot.hasData){
                return Column(
                  children: [
                    Image.network(snapshot.data.urlImage,
                    height: 400,
                    width:400,
                    fit: BoxFit.cover),
                    Text(snapshot.data.nome, style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    )),
                  ], 
                );
              } else if (snapshot.hasError) { 
                return Text(snapshot.error,
                style: 
                TextStyle(
                  color: Colors.red, 
                  fontSize: 20));
              }
              return Container();
            },),
          ElevatedButton(onPressed: () {
            setState(() {
              viewModel.loadPokemon();
            });
            viewModel.loadPokemon();
          }, child: Text("Load Pokemon"))
        ]
      ),
    );
  }
}