///Espacio en memoria único: Al marcar la variable como static, esta pertenece a la clase y no a las instancias (objetos). 
///Sin static, cada vez que crearas un objeto de esa clase, se reservaría espacio en memoria para una copia de baseUrl. 
///Con static, solo existe una copia en toda la ejecución [1, 2].
//Acceso sin instanciar: Puedes usar NombreDeLaClase.baseUrl desde cualquier parte del código sin necesidad de crear 
//un objeto con new o NombreDeLaClase(). Esto es ideal para configuraciones globales como una URL de API [2, 3].
//Constante inmutable: Al combinarlo con const, garantizas que el valor es una "constante de tiempo de compilación", 
//lo que permite al compilador optimizar el rendimiento y asegura que el valor nunca cambie accidentalmente [1, 4]. 

class Endpoints {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
}