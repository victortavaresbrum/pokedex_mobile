// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  final String pokemonName;
  final String pokemonImg;
  final int pokemonId;
  final List<String>? pokemonType;


  PokemonModel({
    required this.pokemonName,
    required this.pokemonImg,
    required this.pokemonId,
    required this.pokemonType,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> data) {

    return PokemonModel(
      pokemonName: data["name"] ?? 'Error Name',
      pokemonImg: data["back_default"] ?? 'Error Image',
      pokemonId: data["id"] ?? 'Error ID',
      pokemonType: data["type"] ?? [],
    );
  }
}

//I/flutter (19120): RangeError (index): Invalid value: Only valid value is 0: 1