

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/pokemon_model.dart';

class PokemonRepository {

  final _dio = Dio();

  Future<List<PokemonModel>> getPokemon(index) async {
  
  try{   final List<PokemonModel> pokemonList = [];

    final apiUrl = 'https://pokeapi.co/api/v2/pokemon/$index';

    final Response response = await _dio.get(apiUrl);

    final String getPokemonName = response.data["name"]; 

    final String getPokemonImg = response.data["sprites"]["versions"]["generation-v"]["black-white"]["animated"]["front_default"]; 

    final int getPokemonId = response.data["id"];

    final pokemonType = (response.data["types"] as List).map((e) => getTypes(e["type"]["name"])).toList();


    print('${response.data} GETPOKEMON');    

    pokemonList.add(PokemonModel(
      pokemonImg: getPokemonImg,
      pokemonName: getPokemonName,
      pokemonId: getPokemonId,
      pokemonType: pokemonType
    ));

      // pokemonList.forEach((element) { 
      //   debugPrint('${element.pokemonId}');
      //   debugPrint('${element.pokemonImg}');
      //   debugPrint('${element.pokemonName}');
      //   debugPrint('${element.pokemonType}');
      //   debugPrint('${element.pokemonType2}');
      // });

    return pokemonList;
  } catch (e){
    print(e);
    rethrow;
  }
  }
  String getTypes(String getPokemonType){
    
    if(getPokemonType == 'grass'){
      return 'https://archives.bulbagarden.net/media/upload/a/a8/Grass_icon_SwSh.png';
    }
    if(getPokemonType == 'water'){
      return 'https://archives.bulbagarden.net/media/upload/8/80/Water_icon_SwSh.png';
    }
    if (getPokemonType=='fire'){
      return 'https://archives.bulbagarden.net/media/upload/a/ab/Fire_icon_SwSh.png';
    }
    if (getPokemonType=='water'){
      return 'https://archives.bulbagarden.net/media/upload/8/80/Water_icon_SwSh.png';
    }
    if (getPokemonType=='flying'){
      return 'https://archives.bulbagarden.net/media/upload/b/b5/Flying_icon_SwSh.png';
    }
    if (getPokemonType=='bug'){
      return 'https://image.pngaaa.com/410/4915410-middle.png';
    }
    if (getPokemonType=='normal'){
      return 'https://archives.bulbagarden.net/media/upload/9/95/Normal_icon_SwSh.png';
    }
    if (getPokemonType=='poison'){
      return 'https://archives.bulbagarden.net/media/upload/8/8d/Poison_icon_SwSh.png';
    }
    if (getPokemonType=='ice'){
      return 'https://archives.bulbagarden.net/media/upload/1/15/Ice_icon_SwSh.png';
    }
    if (getPokemonType=='fairy'){
      return 'https://archives.bulbagarden.net/media/upload/c/c6/Fairy_icon_SwSh.png';
    }
    if (getPokemonType=='psychic'){
      return 'https://archives.bulbagarden.net/media/upload/7/73/Psychic_icon_SwSh.png';
    }
    if (getPokemonType=='electric'){
      return 'https://archives.bulbagarden.net/media/upload/7/7b/Electric_icon_SwSh.png';
    }
    if (getPokemonType=='rock'){
      return 'https://archives.bulbagarden.net/media/upload/1/11/Rock_icon_SwSh.png';
    }
    if (getPokemonType=='steel'){
      return 'https://archives.bulbagarden.net/media/upload/0/09/Steel_icon_SwSh.png';
    }
    if (getPokemonType=='ground'){
      return 'https://archives.bulbagarden.net/media/upload/2/27/Ground_icon_SwSh.png';
    }
    if (getPokemonType=='dragon'){
      return 'https://archives.bulbagarden.net/media/upload/7/70/Dragon_icon_SwSh.png';
    }
    if (getPokemonType=='fighting'){
      return 'https://archives.bulbagarden.net/media/upload/3/3b/Fighting_icon_SwSh.png';
    }
    if (getPokemonType=='ghost'){
      return 'https://archives.bulbagarden.net/media/upload/0/01/Ghost_icon_SwSh.png';
    }
    if (getPokemonType=='dark'){
      return 'https://archives.bulbagarden.net/media/upload/d/d5/Dark_icon_SwSh.png';
    }
    return '';
  }
}