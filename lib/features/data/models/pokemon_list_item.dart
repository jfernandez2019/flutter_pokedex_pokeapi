import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_item.freezed.dart';
part 'pokemon_list_item.g.dart';

@freezed
class PokemonListItem with _$PokemonListItem {
  const factory PokemonListItem({required String name, required String url}) =
      _PokemonListItem;

  factory PokemonListItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemFromJson(json);
}

// Helpers para UI (id y sprite) - lo dejamos fuera de freezed para entenderlo bien
extension PokemonListItemX on PokemonListItem {
  int get id {
    // url ejemplo: https://pokeapi.co/api/v2/pokemon/25/
    final uri = Uri.parse(url);
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    return int.parse(segments.last);
  }

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
