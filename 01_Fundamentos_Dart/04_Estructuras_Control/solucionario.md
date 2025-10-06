# 📋 Solucionario - Estructuras de Control en Dart

## 🎯 Ejercicios Básicos del Contenido Teórico

### ✅ **Ejercicio 1**: Clasificador de números
**Enunciado**: Programa que determine si un número es positivo/negativo/cero y par/impar.

#### 💡 **Solución Completa**:
```dart
import 'dart:io';

void main() {
  // Solicitar número al usuario
  print("Ingrese un número:");
  String? entrada = stdin.readLineSync();
  
  // Validar entrada
  int? numero = int.tryParse(entrada ?? "");
  
  if (numero == null) {
    print("Error: Por favor ingrese un número válido");
    return;
  }
  
  // Clasificar: positivo, negativo o cero
  if (numero > 0) {
    print("$numero es POSITIVO");
  } else if (numero < 0) {
    print("$numero es NEGATIVO");
  } else {
    print("El número es CERO");
  }
  
  // Clasificar: par o impar (solo si no es cero)
  if (numero != 0) {
    if (numero % 2 == 0) {
      print("$numero es PAR");
    } else {
      print("$numero es IMPAR");
    }
  }
}
```

#### 🔄 **Variante con función**:
```dart
void clasificarNumero(int numero) {
  // Análisis de signo
  String signo = numero > 0 ? "POSITIVO" : 
                numero < 0 ? "NEGATIVO" : "CERO";
  print("Signo: $signo");
  
  // Análisis de paridad
  if (numero != 0) {
    String paridad = numero % 2 == 0 ? "PAR" : "IMPAR";
    print("Paridad: $paridad");
  }
}
```

#### 🧪 **Casos de prueba**:
- **Entrada**: `8` → **Salida**: "8 es POSITIVO" + "8 es PAR"
- **Entrada**: `-7` → **Salida**: "-7 es NEGATIVO" + "-7 es IMPAR"
- **Entrada**: `0` → **Salida**: "El número es CERO"

---

### ✅ **Ejercicio 2**: FizzBuzz (Contador 1-15)
**Enunciado**: Contar del 1 al 15, imprimiendo "Fizz" para múltiplos de 3, "Buzz" para múltiplos de 5.

#### 💡 **Solución Básica**:
```dart
void main() {
  for (int i = 1; i <= 15; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("$i: FizzBuzz");
    } else if (i % 3 == 0) {
      print("$i: Fizz");
    } else if (i % 5 == 0) {
      print("$i: Buzz");
    } else {
      print("$i: $i");
    }
  }
}
```

#### 🔄 **Variante elegante**:
```dart
void main() {
  for (int i = 1; i <= 15; i++) {
    String resultado = "";
    if (i % 3 == 0) resultado += "Fizz";
    if (i % 5 == 0) resultado += "Buzz";
    if (resultado.isEmpty) resultado = i.toString();
    
    print("$i: $resultado");
  }
}
```

#### 🧪 **Salida esperada**:
```
1: 1    6: Fizz    11: 11
2: 2    7: 7       12: Fizz
3: Fizz 8: 8       13: 13
4: 4    9: Fizz    14: 14
5: Buzz 10: Buzz   15: FizzBuzz
```

---

### ✅ **Ejercicio 3**: Calculadora de promedio
**Enunciado**: Calcular promedio de 5 calificaciones y determinar aprobación.

#### 💡 **Solución con validación**:
```dart
import 'dart:io';

void main() {
  List<double> calificaciones = [];
  
  print("=== CALCULADORA DE PROMEDIO ===");
  print("Ingrese 5 calificaciones (0-100):\n");
  
  // Recolectar 5 calificaciones
  for (int i = 1; i <= 5; i++) {
    double? calificacion;
    
    do {
      print("Calificación $i:");
      String? entrada = stdin.readLineSync();
      calificacion = double.tryParse(entrada ?? "");
      
      if (calificacion == null || calificacion < 0 || calificacion > 100) {
        print("Error: Ingrese una calificación entre 0 y 100");
        calificacion = null;
      }
    } while (calificacion == null);
    
    calificaciones.add(calificacion);
  }
  
  // Calcular promedio
  double suma = 0;
  for (double nota in calificaciones) {
    suma += nota;
  }
  double promedio = suma / calificaciones.length;
  
  // Mostrar resultados
  print("\n=== RESULTADOS ===");
  print("Calificaciones: ${calificaciones.join(', ')}");
  print("Promedio: ${promedio.toStringAsFixed(2)}");
  
  // Determinar aprobación
  if (promedio >= 70) {
    print("✅ APROBADO - ¡Felicidades!");
    if (promedio >= 90) {
      print("🌟 Excelencia académica");
    } else if (promedio >= 85) {
      print("⭐ Muy buen desempeño");
    }
  } else {
    print("❌ REPROBADO - Necesitas mejorar");
    print("Faltan ${(70 - promedio).toStringAsFixed(2)} puntos para aprobar");
  }
}
```

---

## 🟡 Ejercicios Intermedios

### ✅ **Ejercicio 4**: Adivina el número
**Enunciado**: Juego donde el usuario adivina un número del 1-100 en 7 intentos.

#### 💡 **Solución completa**:
```dart
import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecreto = random.nextInt(100) + 1; // 1 to 100
  int intentos = 7;
  bool adivinado = false;
  
  print("🎯 ¡ADIVINA EL NÚMERO!");
  print("He pensado un número entre 1 y 100");
  print("Tienes $intentos intentos para adivinarlo\n");
  
  while (intentos > 0 && !adivinado) {
    print("Intentos restantes: $intentos");
    print("Tu número:");
    
    String? entrada = stdin.readLineSync();
    int? intento = int.tryParse(entrada ?? "");
    
    if (intento == null || intento < 1 || intento > 100) {
      print("⚠️ Ingresa un número válido entre 1 y 100\n");
      continue; // No descontar intento por entrada inválida
    }
    
    intentos--;
    
    if (intento == numeroSecreto) {
      adivinado = true;
      int intentosUsados = 7 - intentos;
      print("🎉 ¡CORRECTO! El número era $numeroSecreto");
      print("Lo adivinaste en $intentosUsados intento(s)");
      
      // Clasificar desempeño
      if (intentosUsados <= 3) {
        print("🏆 ¡Increíble! Eres un maestro");
      } else if (intentosUsados <= 5) {
        print("👍 ¡Muy bien! Buen trabajo");
      } else {
        print("😅 ¡Por poco! Lo lograste al final");
      }
    } else if (intento < numeroSecreto) {
      print("📈 El número es MAYOR que $intento");
    } else {
      print("📉 El número es MENOR que $intento");
    }
    
    if (!adivinado && intentos > 0) {
      print(""); // Línea en blanco para separar intentos
    }
  }
  
  if (!adivinado) {
    print("💀 ¡Se acabaron los intentos!");
    print("El número era: $numeroSecreto");
    print("¡Mejor suerte la próxima vez!");
  }
}
```

---

### ✅ **Ejercicio 5**: Factorial
**Enunciado**: Calcular factorial usando diferentes bucles.

#### 💡 **Solución con for**:
```dart
int factorialFor(int n) {
  if (n < 0) return -1; // Error
  if (n == 0 || n == 1) return 1;
  
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}
```

#### 💡 **Solución con while**:
```dart
int factorialWhile(int n) {
  if (n < 0) return -1; // Error
  if (n == 0 || n == 1) return 1;
  
  int resultado = 1;
  int contador = 2;
  while (contador <= n) {
    resultado *= contador;
    contador++;
  }
  return resultado;
}
```

#### 💡 **Programa principal comparativo**:
```dart
import 'dart:io';

void main() {
  print("Ingrese un número para calcular su factorial:");
  String? entrada = stdin.readLineSync();
  int? numero = int.tryParse(entrada ?? "");
  
  if (numero == null || numero < 0) {
    print("Error: Ingrese un número entero positivo");
    return;
  }
  
  // Calcular con ambos métodos
  int factFor = factorialFor(numero);
  int factWhile = factorialWhile(numero);
  
  print("\nResultados:");
  print("Factorial de $numero usando FOR: $factFor");
  print("Factorial de $numero usando WHILE: $factWhile");
  print("¿Son iguales? ${factFor == factWhile ? 'SÍ' : 'NO'}");
  
  // Mostrar proceso paso a paso
  print("\nProceso paso a paso:");
  int temp = 1;
  for (int i = 1; i <= numero; i++) {
    temp *= i;
    print("$i! = $temp");
  }
}
```

---

### ✅ **Ejercicio 6**: Menú interactivo de calculadora
**Enunciado**: Sistema con menú para operaciones matemáticas básicas.

#### 💡 **Solución completa**:
```dart
import 'dart:io';

void main() {
  bool continuar = true;
  
  while (continuar) {
    mostrarMenu();
    int opcion = leerOpcion();
    
    switch (opcion) {
      case 1:
        realizarOperacion("suma");
        break;
      case 2:
        realizarOperacion("resta");
        break;
      case 3:
        realizarOperacion("multiplicación");
        break;
      case 4:
        realizarOperacion("división");
        break;
      case 5:
        print("¡Hasta luego! 👋");
        continuar = false;
        break;
      default:
        print("❌ Opción inválida. Intente nuevamente.\n");
    }
  }
}

void mostrarMenu() {
  print("=" * 40);
  print("🧮 CALCULADORA INTERACTIVA");
  print("=" * 40);
  print("1. Suma");
  print("2. Resta");
  print("3. Multiplicación");
  print("4. División");
  print("5. Salir");
  print("-" * 40);
}

int leerOpcion() {
  print("Seleccione una opción (1-5):");
  String? entrada = stdin.readLineSync();
  return int.tryParse(entrada ?? "") ?? 0;
}

void realizarOperacion(String tipoOperacion) {
  print("\n--- ${tipoOperacion.toUpperCase()} ---");
  
  // Leer primer número
  double? num1 = leerNumero("Ingrese el primer número:");
  if (num1 == null) return;
  
  // Leer segundo número
  double? num2 = leerNumero("Ingrese el segundo número:");
  if (num2 == null) return;
  
  // Realizar operación
  double? resultado;
  String simbolo;
  
  switch (tipoOperacion) {
    case "suma":
      resultado = num1 + num2;
      simbolo = "+";
      break;
    case "resta":
      resultado = num1 - num2;
      simbolo = "-";
      break;
    case "multiplicación":
      resultado = num1 * num2;
      simbolo = "×";
      break;
    case "división":
      if (num2 == 0) {
        print("❌ Error: No se puede dividir por cero\n");
        return;
      }
      resultado = num1 / num2;
      simbolo = "÷";
      break;
    default:
      print("❌ Operación no válida\n");
      return;
  }
  
  // Mostrar resultado
  print("\n✅ Resultado:");
  print("$num1 $simbolo $num2 = ${resultado.toStringAsFixed(2)}");
  print("");
}

double? leerNumero(String mensaje) {
  print(mensaje);
  String? entrada = stdin.readLineSync();
  double? numero = double.tryParse(entrada ?? "");
  
  if (numero == null) {
    print("❌ Error: Ingrese un número válido\n");
  }
  
  return numero;
}
```

---

## 🔴 Ejercicios Avanzados

### ✅ **Ejercicio 7**: Números primos (1-100)
**Enunciado**: Encontrar todos los números primos entre 1 y 100.

#### 💡 **Solución eficiente**:
```dart
void main() {
  print("🔢 NÚMEROS PRIMOS DEL 1 AL 100");
  print("=" * 50);
  
  List<int> primos = [];
  
  for (int numero = 2; numero <= 100; numero++) {
    if (esPrimo(numero)) {
      primos.add(numero);
    }
  }
  
  // Mostrar resultados
  print("Números primos encontrados (${primos.length}):");
  for (int i = 0; i < primos.length; i++) {
    // Imprimir en filas de 10
    print("${primos[i].toString().padLeft(3)} ", 
          newline: (i + 1) % 10 == 0 || i == primos.length - 1);
  }
  
  print("\n📊 Estadísticas:");
  print("• Total de primos: ${primos.length}");
  print("• Primer primo: ${primos.first}");
  print("• Último primo: ${primos.last}");
  print("• Primos menores a 50: ${primos.where((p) => p < 50).length}");
}

bool esPrimo(int numero) {
  if (numero < 2) return false;
  if (numero == 2) return true;
  if (numero % 2 == 0) return false;
  
  // Solo verificar divisores impares hasta √numero
  for (int i = 3; i * i <= numero; i += 2) {
    if (numero % i == 0) return false;
  }
  
  return true;
}

// Extensión para control de salto de línea en print
extension PrintExtension on String {
  void print({bool newline = true}) {
    if (newline) {
      stdout.writeln(this);
    } else {
      stdout.write(this);
    }
  }
}
```

---

### ✅ **Ejercicio 8**: Patrón de asteriscos
**Enunciado**: Dibujar triángulo de asteriscos.

#### 💡 **Solución con múltiples patrones**:
```dart
void main() {
  int altura = 5;
  
  print("📐 PATRONES DE ASTERISCOS");
  print("=" * 30);
  
  // Patrón 1: Triángulo básico
  print("\n1. Triángulo básico:");
  trianguloCreciente(altura);
  
  // Patrón 2: Triángulo decreciente
  print("\n2. Triángulo decreciente:");
  trianguloDecreciente(altura);
  
  // Patrón 3: Pirámide centrada
  print("\n3. Pirámide centrada:");
  piramideCentrada(altura);
  
  // Patrón 4: Diamante
  print("\n4. Diamante:");
  diamante(altura);
}

void trianguloCreciente(int altura) {
  for (int i = 1; i <= altura; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("*");
    }
    print(""); // Nueva línea
  }
}

void trianguloDecreciente(int altura) {
  for (int i = altura; i >= 1; i--) {
    for (int j = 1; j <= i; j++) {
      stdout.write("*");
    }
    print("");
  }
}

void piramideCentrada(int altura) {
  for (int i = 1; i <= altura; i++) {
    // Espacios para centrar
    for (int j = 1; j <= altura - i; j++) {
      stdout.write(" ");
    }
    // Asteriscos
    for (int j = 1; j <= (2 * i - 1); j++) {
      stdout.write("*");
    }
    print("");
  }
}

void diamante(int altura) {
  // Parte superior (incluyendo centro)
  for (int i = 1; i <= altura; i++) {
    for (int j = 1; j <= altura - i; j++) {
      stdout.write(" ");
    }
    for (int j = 1; j <= (2 * i - 1); j++) {
      stdout.write("*");
    }
    print("");
  }
  
  // Parte inferior
  for (int i = altura - 1; i >= 1; i--) {
    for (int j = 1; j <= altura - i; j++) {
      stdout.write(" ");
    }
    for (int j = 1; j <= (2 * i - 1); j++) {
      stdout.write("*");
    }
    print("");
  }
}
```

---

### ✅ **Ejercicio 9**: Validador de entrada robusto
**Enunciado**: Sistema completo de validación con múltiples tipos de datos.

#### 💡 **Solución completa**:
```dart
import 'dart:io';

void main() {
  print("🔐 SISTEMA DE VALIDACIÓN DE ENTRADA");
  print("=" * 50);
  
  // Validar diferentes tipos de datos
  String nombre = validarTexto("Ingrese su nombre:", 
                              minLength: 2, maxLength: 30, soloLetras: true);
  
  int edad = validarEntero("Ingrese su edad:", 
                          minValue: 0, maxValue: 120);
  
  double salario = validarDecimal("Ingrese su salario:", 
                                 minValue: 0, maxValue: 1000000);
  
  String email = validarEmail("Ingrese su email:");
  
  // Mostrar resumen
  print("\n✅ DATOS VALIDADOS CORRECTAMENTE:");
  print("👤 Nombre: $nombre");
  print("📅 Edad: $edad años");
  print("💰 Salario: \$${salario.toStringAsFixed(2)}");
  print("📧 Email: $email");
}

String validarTexto(String mensaje, {
  int minLength = 1, 
  int maxLength = 100, 
  bool soloLetras = false
}) {
  String? entrada;
  
  do {
    print("\n$mensaje");
    if (soloLetras) print("(Solo letras y espacios)");
    print("Longitud: $minLength-$maxLength caracteres");
    
    entrada = stdin.readLineSync()?.trim();
    
    if (entrada == null || entrada.isEmpty) {
      print("❌ Error: El campo no puede estar vacío");
      continue;
    }
    
    if (entrada.length < minLength || entrada.length > maxLength) {
      print("❌ Error: Debe tener entre $minLength y $maxLength caracteres");
      continue;
    }
    
    if (soloLetras && !RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$').hasMatch(entrada)) {
      print("❌ Error: Solo se permiten letras y espacios");
      continue;
    }
    
    break;
  } while (true);
  
  return entrada;
}

int validarEntero(String mensaje, {int? minValue, int? maxValue}) {
  int? numero;
  
  do {
    print("\n$mensaje");
    if (minValue != null && maxValue != null) {
      print("Rango válido: $minValue - $maxValue");
    }
    
    String? entrada = stdin.readLineSync();
    numero = int.tryParse(entrada ?? "");
    
    if (numero == null) {
      print("❌ Error: Ingrese un número entero válido");
      continue;
    }
    
    if (minValue != null && numero < minValue) {
      print("❌ Error: El valor mínimo es $minValue");
      continue;
    }
    
    if (maxValue != null && numero > maxValue) {
      print("❌ Error: El valor máximo es $maxValue");
      continue;
    }
    
    break;
  } while (true);
  
  return numero;
}

double validarDecimal(String mensaje, {double? minValue, double? maxValue}) {
  double? numero;
  
  do {
    print("\n$mensaje");
    if (minValue != null && maxValue != null) {
      print("Rango válido: $minValue - $maxValue");
    }
    
    String? entrada = stdin.readLineSync();
    numero = double.tryParse(entrada ?? "");
    
    if (numero == null) {
      print("❌ Error: Ingrese un número válido");
      continue;
    }
    
    if (minValue != null && numero < minValue) {
      print("❌ Error: El valor mínimo es $minValue");
      continue;
    }
    
    if (maxValue != null && numero > maxValue) {
      print("❌ Error: El valor máximo es $maxValue");
      continue;
    }
    
    break;
  } while (true);
  
  return numero;
}

String validarEmail(String mensaje) {
  String? email;
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  
  do {
    print("\n$mensaje");
    print("Formato: ejemplo@dominio.com");
    
    email = stdin.readLineSync()?.trim();
    
    if (email == null || email.isEmpty) {
      print("❌ Error: El email no puede estar vacío");
      continue;
    }
    
    if (!emailRegex.hasMatch(email)) {
      print("❌ Error: Formato de email inválido");
      continue;
    }
    
    break;
  } while (true);
  
  return email;
}
```

---

## 📊 Matriz de Evaluación Detallada

### 🎯 **Criterios por Ejercicio**

| Ejercicio | Conceptos Clave | Puntuación | Criterios Específicos |
|-----------|----------------|------------|---------------------|
| **1-3** (Básicos) | Condicionales, validación | 20 pts | Sintaxis correcta, lógica clara |
| **4-6** (Intermedios) | Bucles, menús, funciones | 30 pts | Estructuras apropiadas, validaciones |
| **7-9** (Avanzados) | Algoritmos, patrones, robustez | 50 pts | Eficiencia, manejo de casos edge |

### 📈 **Rúbrica de Calificación**

#### 🟢 **Excelente** (90-100%)
- Todas las estructuras implementadas correctamente
- Código limpio y bien documentado
- Manejo completo de errores y validaciones
- Soluciones eficientes y elegantes

#### 🟡 **Bueno** (70-89%)
- Mayoría de estructuras correctas
- Funcionalidad básica completa
- Algunas validaciones implementadas
- Código funcional con mejoras menores

#### 🟠 **Regular** (50-69%)
- Estructuras básicas funcionan
- Funcionalidad parcial
- Validaciones mínimas
- Errores menores que no impiden ejecución

#### 🔴 **Insuficiente** (<50%)
- Errores de sintaxis o lógica importantes
- Funcionalidad incompleta
- Sin validaciones
- Código no ejecutable o con fallos críticos

---

## 🎓 **Notas para el Profesor**

### 📝 **Sugerencias de Evaluación**:
1. **Evaluación progresiva**: Revisar ejercicios básicos antes de avanzar
2. **Código en vivo**: Hacer que los estudiantes expliquen su lógica
3. **Debugging colaborativo**: Resolver errores juntos en clase
4. **Variantes creativas**: Permitir soluciones alternativas válidas

### ⏰ **Gestión del Tiempo**:
- **Ejercicios 1-3**: 45-60 minutos
- **Ejercicios 4-6**: 60-90 minutos  
- **Ejercicios 7-9**: 90-120 minutos

### 🔄 **Actividades Complementarias**:
- Code review entre pares
- Optimización de soluciones existentes
- Competencias de programación friendly
- Proyectos creativos usando las estructuras aprendidas

---

**✨ ¡Estructuras de control dominadas con éxito!**

*Estas soluciones proporcionan una base sólida para que los estudiantes comprendan y apliquen las estructuras de control en Dart de manera efectiva y profesional.*
