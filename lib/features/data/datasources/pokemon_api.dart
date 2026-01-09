import 'package:dio/dio.dart';
import '../models/pokemon_list_item.dart';

class PokemonApi {
  
  final Dio _dio; //instancia de dio
  PokemonApi(this._dio); //constructor de dio

  Future<List<PokemonListItem>> fetchPokemonPage({
    required int limit,
    required int offset,
  }) async {
    final response = await _dio.get(
      '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    final data = response.data as Map<String,dynamic>;
    final results = (data['results'] as List).cast<Map<String,dynamic>>();

    return results.map(PokemonListItem.fromJson).toList();
  }
}
