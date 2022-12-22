// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_api_app/repository/pokemon_repository.dart';

import '../models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../screens/pokemon_screen.dart';

class PokemonList extends StatelessWidget {
  PokemonList({
    Key? key,
    required this.future,
  }) : super(key: key);

  final pokemonRepository = PokemonRepository();

  final Future<List<PokemonModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: Offset.fromDirection(0, 0))
              ]),
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PokemonScreen(
                  pokemonImg: '${snapshot.data?[0].pokemonImg}',
                  pokemonName: '${snapshot.data?[0].pokemonName}',
                );
              },));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 80,
                    child: Image.network('${snapshot.data?[0].pokemonImg}')),
                SizedBox(
                    width: 100,
                    child: Text(
                      '${snapshot.data?[0].pokemonName.capitalize()}',
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?[0].pokemonType?.length ?? 0,
                      itemBuilder: ((context, index) {
                        final type = snapshot.data?[0].pokemonType![index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                              '$type',
                              width: 30,
                            ),
                          ),
                          
                        ]);
                      })),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
