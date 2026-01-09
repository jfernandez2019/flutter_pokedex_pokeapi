# Flutter Pokedex App 🐱‍👤

Aplicación móvil desarrollada en **Flutter** con fines **educativos**, que consume datos de la **PokeAPI** para mostrar un listado de Pokémon y, progresivamente, su detalle.

Este proyecto está pensado como una **base de aprendizaje real**, utilizando herramientas y patrones comunes en proyectos profesionales Flutter, priorizando claridad, separación de responsabilidades y comprensión del flujo completo.

---

## 🎯 Objetivo del proyecto

- Aprender a consumir APIs REST en Flutter
- Entender cómo estructurar una app real desde cero
- Modelar datos JSON de forma segura
- Manejar estado asincrónico correctamente
- Separar UI, lógica y datos
- Crear una base reutilizable para otros proyectos

---

## 🌐 Fuente de datos – PokeAPI

API pública utilizada para obtener información de Pokémon.

- Listado paginado
- Detalle por nombre o ID
- Sprites oficiales

📎 Documentación: https://pokeapi.co/

---

## 🧱 Arquitectura general del proyecto

El proyecto sigue una **arquitectura por capas**, inspirada en Clean Architecture, adaptada a un contexto educativo.

lib/
├── core/
│ ├── constants/ # Configuraciones globales (URLs, etc.)
│ └── network/ # Cliente HTTP (Dio)
│
├── features/
│ └── pokemon/
│ ├── data/ # Modelos, API, repositorios
│ ├── domain/ # Contratos / abstracciones
│ └── presentation/
│ ├── providers/ # Riverpod (estado y dependencias)
│ ├── screens/ # Pantallas
│ └── widgets/ # Widgets reutilizables



### ¿Por qué esta arquitectura?
- La UI no conoce detalles de red
- La lógica no depende de widgets
- El código escala sin volverse caótico
- Facilita testing y mantenimiento

---

## 📡 Dio – Capa de red (HTTP)

`dio` es el cliente HTTP utilizado para comunicarse con la API.

### Responsabilidad de Dio en el proyecto
- Realizar requests HTTP
- Manejar parámetros, headers y timeouts
- Centralizar configuración de red
- Evitar lógica de red en la UI

### Ejemplo de uso
```dart
final response = await dio.get(
  '/pokemon',
  queryParameters: {
    'limit': 20,
    'offset': 0,
  },
);


@freezed
class PokemonListItem with _$PokemonListItem {
  const factory PokemonListItem({
    required String name,
    required String url,
  }) = _PokemonListItem;

  factory PokemonListItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemFromJson(json);
}


final pokemon = PokemonListItem.fromJson(json);
print(pokemon.name);

🛠️ Generación de código

Cada vez que se crea o modifica un modelo:

dart run build_runner build --delete-conflicting-outputs


Esto genera automáticamente los archivos:

*.freezed.dart

*.g.dart

### Provider de dependencia
final dioProvider = Provider<Dio>((ref) => createDio());

Provider asincrónico (estado)
final pokemonProvider = FutureProvider<List<PokemonListItem>>((ref) async {
  final api = ref.watch(pokemonApiProvider);
  return api.fetchPokemon();
});


🎨 UI – Uso del estado en widgets

La UI no contiene lógica de negocio.
Solo observa el estado y renderiza.

Ejemplo de uso en pantalla
final pokemonAsync = ref.watch(pokemonProvider);

pokemonAsync.when(
  data: (data) => ListView(...),
  loading: () => CircularProgressIndicator(),
  error: (e, _) => Text('Error'),
);




