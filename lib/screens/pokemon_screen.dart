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
               Image.network('https://i.pinimg.com/originals/f6/a1/8a/f6a18ac56651ce4f9ca7e0230706a0b6.png'),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                    child: Image.network(
                  pokemonImg,
                  scale: 0.3,
                )),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.red,
              ),
             
            ],
          ),
          Center(
            child: Text(
              pokemonName.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 36,
                color: Colors.yellow,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 20,

                  )
                ]


              ),
            ),
          ),
        ],
      ),
    );
  }
}
