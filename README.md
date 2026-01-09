# Flutter Pokedex App 🐱‍👤

Aplicación móvil desarrollada en **Flutter** con fines **educativos**, que consume datos de la **PokeAPI** para mostrar una lista de Pokémon y, progresivamente, su detalle.

Este proyecto está diseñado como una **guía de aprendizaje real**, aplicando buenas prácticas usadas en proyectos profesionales Flutter, sin sobreingeniería.

---

## 📌 Objetivo del proyecto

- Aprender a consumir APIs REST en Flutter
- Comprender el manejo de estado con Riverpod
- Modelar datos JSON de forma segura
- Separar responsabilidades usando arquitectura por capas
- Construir una base reutilizable para otros proyectos

---

## 🚀 Tecnologías utilizadas

### 🧩 Flutter
Framework principal para el desarrollo de aplicaciones móviles multiplataforma.

---

### 🌐 PokeAPI
API pública utilizada para obtener información de Pokémon.

- Listado paginado de Pokémon
- Detalle por nombre o ID
- Sprites oficiales

Documentación: https://pokeapi.co/

---

## 📡 Dio – Cliente HTTP

`dio` es el cliente HTTP utilizado para comunicarse con la API.

### ¿Por qué Dio?
- Manejo avanzado de requests y responses
- Timeouts configurables
- Interceptors (logs, headers, auth)
- Mejor control de errores que `http`

### Ejemplo de uso
```dart
final response = await dio.get(
  '/pokemon',
  queryParameters: {
    'limit': 20,
    'offset': 0,
  },
);
