// Clase Persona
class Persona {
  String nombre;
  int edad;
  Persona(this.nombre, this.edad);
  void saludar() => print("Hola, soy $nombre");
}

// Herencia
class Estudiante extends Persona {
  String carrera;
  Estudiante(String nombre, int edad, this.carrera) : super(nombre, edad);
}
