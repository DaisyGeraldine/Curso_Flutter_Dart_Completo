// Nullable
int? edad;
edad = null;
print(edad ?? "Sin valor");

// Excepción
try {
  int? x;
  print(x!);
} catch (e) {
  print("Error: $e");
}
