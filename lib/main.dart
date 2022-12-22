import 'package:flutter/material.dart';
import 'package:pokemon_api_app/repository/pokemon_repository.dart';
import 'package:pokemon_api_app/screens/home_screen.dart';


void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}