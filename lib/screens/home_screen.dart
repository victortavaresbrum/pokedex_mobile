import 'package:flutter/material.dart';
import 'package:pokemon_api_app/models/pokemon_model.dart';
import 'package:pokemon_api_app/repository/pokemon_repository.dart';

import '../theme.dart';
import '../widgets/pokemon_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final pokemonRepository = PokemonRepository();
  ThemeData theme = PokemonTheme.theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              
               const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://mlohrktvfr9b.i.optimole.com/cb:tVDx~16b5e/w:702/h:702/q:mauto/https://www.nerdstickers.com.br/wp-content/uploads/2020/11/adesivo-Pokedex-Air-Force-1-danilo-the-hype-nerd-stickers.png'),
              ),
              Image.network('https://logosmarcas.net/wp-content/uploads/2020/05/Pokemon-Logo.png',width: 100,),
               
            ],
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 264,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: PokemonList(
                  future: pokemonRepository.getPokemon(index + 1),
                ),
              );
            }),
      ),
    );
  }
}
