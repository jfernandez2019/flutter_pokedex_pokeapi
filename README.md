# Flutter Pokedex App 🐱‍👤

Aplicación móvil desarrollada en **Flutter** con fines **educativos**, que consume datos de la **PokeAPI** para mostrar una lista de Pokémon y sus detalles.

Este proyecto está pensado como **guía de aprendizaje**, aplicando buenas prácticas reales de desarrollo Flutter, sin sobreingeniería.

---

## 📌 Objetivo del proyecto

- Aprender a consumir APIs REST en Flutter
- Comprender el manejo de estado con Riverpod
- Separar responsabilidades usando una arquitectura por capas
- Modelar datos JSON de forma segura
- Construir una base sólida para proyectos Flutter más grandes

---

## 🚀 Tecnologías utilizadas

### 🧩 Flutter
Framework principal para desarrollo de aplicaciones móviles multiplataforma.

---

### 🌐 PokeAPI
API pública utilizada para obtener información de Pokémon.

- Lista paginada de Pokémon
- Detalle por nombre o ID
- Sprites oficiales

Documentación: https://pokeapi.co/

---

### 📡 Dio – Cliente HTTP
`dio` se utiliza para realizar las llamadas a la API.

¿Por qué Dio?
- Manejo avanzado de requests y responses
- Interceptors (logs, headers, errores)
- Mejor control de timeouts
- Más robusto que `http`

📌 Se centraliza la configuración del cliente HTTP para reutilizarlo en toda la app.

---

### 🔁 Riverpod – Manejo de estado
`flutter_riverpod` se usa para:

- Inyección de dependencias (Dio, APIs)
- Manejo de estado asincrónico (`FutureProvider`)
- Separar lógica de negocio de la UI
- Evitar `setState` innecesarios

📌 Beneficios clave:
- Código más predecible
- Fácil testing
- Escalabilidad
- No depende del `BuildContext`

---

### ❄️ Freezed + JSON Serializable – Modelos inmutables
Se utilizan para:

- Crear modelos de datos inmutables
- Parsear JSON de forma segura
- Evitar errores por null o tipos incorrectos
- Reducir código boilerplate

📌 El código se genera automáticamente usando `build_runner`.

---

### 🖼️ Cached Network Image
Utilizado para mostrar sprites de Pokémon:

- Cachea imágenes descargadas
- Mejora performance
- Reduce consumo de red

---

## 🗂️ Arquitectura del proyecto

El proyecto sigue una arquitectura **por capas**:

