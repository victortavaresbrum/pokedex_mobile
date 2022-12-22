import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({
    super.key,
    required this.pokemonImg,
    required this.pokemonName,
  });

  final String pokemonImg;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
        
            children: [
              Center(
                  child: Image.network(
                pokemonImg,
                scale: 0.3,
              )),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.red,
              )
            ],
          ),
          Center(
            child: Text(
              pokemonName.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.w800,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
