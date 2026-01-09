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

```
lib/
 ├── core/
 │    ├── constants/      # Configuraciones globales (URLs, etc.)
 │    └── network/        # Cliente HTTP (Dio)
 │
 ├── features/
 │    └── pokemon/
 │         ├── data/      # Modelos, API, repositorios
 │         ├── domain/    # Contratos / abstracciones
 │         └── presentation/
 │              ├── providers/  # Riverpod (estado y dependencias)
 │              ├── screens/    # Pantallas
 │              └── widgets/    # Widgets reutilizables
```

### ¿Por qué esta arquitectura?
- La UI no conoce detalles de red
- La lógica de negocio no depende de widgets
- El código escala sin volverse caótico
- Facilita testing y mantenimiento

---

## 📡 Capa de red – Dio (HTTP Client)

`dio` es el cliente HTTP utilizado para comunicarse con la PokeAPI.

### Rol de Dio en el proyecto
- Ejecutar requests HTTP
- Manejar parámetros, headers y timeouts
- Centralizar configuración de red
- Evitar lógica de red dentro de la UI

### Ejemplo de uso
```dart
final response = await dio.get(
  '/pokemon',
  queryParameters: {
    'limit': 20,
    'offset': 0,
  },
);
```

### Regla clave
> Dio **nunca** se usa directamente en widgets.  
> Siempre se encapsula en una clase de API o repositorio.

---

## 🧊 Modelado de datos – Freezed + JSON Serializable

Se utilizan para transformar respuestas JSON en **objetos Dart seguros, tipados e inmutables**.

### Rol de Freezed en el proyecto
- Definir modelos de datos
- Convertir JSON → Dart automáticamente
- Evitar errores de tipo y null
- Reducir código repetitivo (boilerplate)

### Ejemplo de modelo
```dart
@freezed
class PokemonListItem with _$PokemonListItem {
  const factory PokemonListItem({
    required String name,
    required String url,
  }) = _PokemonListItem;

  factory PokemonListItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemFromJson(json);
}
```

### Uso del modelo
```dart
final pokemon = PokemonListItem.fromJson(json);
print(pokemon.name);
```

### Regla mental
> Si una API devuelve JSON → usar Freezed + json_serializable

---

### 🛠️ Generación de código

Cada vez que se crea o modifica un modelo:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Esto genera automáticamente:
- `*.freezed.dart`
- `*.g.dart`

---

## 🔁 Manejo de estado e inyección de dependencias – Riverpod

`flutter_riverpod` se utiliza como **gestor de estado** y **sistema de inyección de dependencias**.

### Rol de Riverpod en el proyecto
- Proveer dependencias (Dio, APIs)
- Manejar estado asincrónico
- Separar lógica de negocio de la UI
- Controlar el ciclo de vida de los datos

---

### Provider de dependencia
```dart
final dioProvider = Provider<Dio>((ref) => createDio());
```

Riverpod reemplaza la necesidad de crear singletons manuales.

---

### Provider asincrónico (estado)
```dart
final pokemonProvider = FutureProvider<List<PokemonListItem>>((ref) async {
  final api = ref.watch(pokemonApiProvider);
  return api.fetchPokemon();
});
```

Riverpod gestiona automáticamente:
- loading
- error
- data

---

## 🎨 UI – Consumo de estado

La UI **no contiene lógica de negocio**.  
Solo observa el estado y renderiza.

### Ejemplo de uso en una pantalla
```dart
final pokemonAsync = ref.watch(pokemonProvider);

pokemonAsync.when(
  data: (data) => ListView(...),
  loading: () => CircularProgressIndicator(),
  error: (e, _) => Text('Error'),
);
```

### Regla clave de UI
> La UI solo decide **qué mostrar**,  
> nunca **cómo obtener los datos**.

---

## 🧠 Conexión entre capas

| Capa | Responsabilidad |
|-----|----------------|
| UI | Renderizar datos |
| Riverpod | Gestionar estado y dependencias |
| Dio | Comunicación con API |
| Freezed | Modelado seguro de datos |

### Regla de oro del proyecto
> La UI no sabe de HTTP  
> HTTP no sabe de Widgets  
> El estado vive fuera del Widget  

---

## 📱 Funcionalidades actuales

- Listado paginado de Pokémon
- Visualización de nombre, ID y sprite
- Manejo de estados: loading / error / success
- Base lista para pantalla de detalle

---

## 🔄 Proyectos donde este stack es reutilizable

Este mismo enfoque aplica directamente a:

- 📦 Catálogo de productos
- 🛒 Ecommerce
- 📇 CRM simple
- ☁️ App de clima
- 💱 Cotizaciones financieras
- 🏢 Apps internas empresariales

Cambian las APIs, **no la arquitectura**.

---

## 🚨 Errores comunes a evitar

❌ Llamar Dio desde widgets  
❌ Manejar JSON manualmente  
❌ Usar `setState` para datos remotos  
❌ Mezclar lógica de negocio con UI  
❌ No documentar el proyecto  

---

## 🧩 Conclusión de aprendizaje

Este proyecto sirve como:
- Guía de arquitectura Flutter
- Ejemplo real de consumo de APIs
- Base para proyectos más grandes
- Referencia futura reutilizable

Entender este flujo completo significa haber superado la etapa inicial en Flutter.

---

## 📌 Próximos pasos

- Pantalla de detalle de Pokémon
- Navegación a detalle
- Infinite scroll
- Manejo de errores avanzado
- Tests básicos

---

## 📄 Licencia

Proyecto de uso educativo.
