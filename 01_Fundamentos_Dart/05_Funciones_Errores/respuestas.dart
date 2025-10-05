// Área de círculo
double areaCirculo(double radio) => 3.1416 * radio * radio;

// Manejo de errores
try {
  int resultado = 10 ~/ 0;
} catch (e) {
  print("Error: $e");
}
