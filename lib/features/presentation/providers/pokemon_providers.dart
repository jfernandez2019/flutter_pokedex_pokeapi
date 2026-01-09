// ==============================
// IMPORTS
// ==============================

// Riverpod: sistema de providers (inyección de dependencias + estado)
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dio: cliente HTTP (para llamar APIs)
import 'package:dio/dio.dart';

// Función que CREA una instancia configurada de Dio
// (baseUrl, interceptors, headers, etc.)
import '../../../../core/network/dio_provider.dart';

// Clase que sabe cómo llamar a la PokeAPI
import '../../data/datasources/pokemon_api.dart';

// Modelo de datos (name, url, helpers, etc.)
import '../../data/models/pokemon_list_item.dart';


// ==============================
// PROVIDER 1: Dio
// ==============================

// Este provider se encarga SOLO de crear y proveer Dio
final dioProvider = Provider<Dio>((ref) {
  // createDio() devuelve un Dio configurado
  // (esto NO se ejecuta ahora, solo cuando alguien lo necesita)
  return createDio();
});


// ==============================
// PROVIDER 2: PokemonApi
// ==============================

// Este provider crea la API que usa Dio internamente
final pokemonApiProvider = Provider<PokemonApi>((ref) {
  // Le pedimos a Riverpod el Dio
  // ref.watch significa: "usá este provider y escuchá cambios"
  final dio = ref.watch(dioProvider);

  // Creamos la API pasándole Dio
  // (inyección de dependencias)
  return PokemonApi(dio);
});


// ==============================
// PROVIDER 3: Página de Pokémon (ASÍNCRONO)
// ==============================

// Este provider:
// - es asíncrono (FutureProvider)
// - recibe un parámetro (family)
// - devuelve una lista de PokemonListItem
final pokemonPageProvider =
    FutureProvider.family<List<PokemonListItem>, int>((ref, page) async {

  // Cantidad de Pokémon por página
  const limit = 20;

  // Offset = desde dónde empezar
  // page = 0 → offset = 0
  // page = 1 → offset = 20
  // page = 2 → offset = 40
  final offset = page * limit;

  // Pedimos la API (Riverpod la crea o reutiliza)
  final api = ref.watch(pokemonApiProvider);

  // Llamamos a la API y devolvemos el resultado
  // Riverpod se encarga de:
  // - loading
  // - error
  // - data
  return api.fetchPokemonPage(
    limit: limit,
    offset: offset,
  );
});
