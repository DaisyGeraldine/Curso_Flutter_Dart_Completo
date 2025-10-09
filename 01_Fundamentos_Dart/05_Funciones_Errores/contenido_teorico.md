# 📚 Módulo 05: Funciones y Manejo de Errores en Dart

## 🎯 Objetivos de aprendizaje

Al completar este módulo, el estudiante será capaz de:

### 🎓 Objetivos principales
- **Comprender** el concepto y propósito de las funciones como bloques reutilizables
- **Crear** funciones con diferentes tipos de parámetros y valores de retorno
- **Aplicar** funciones para modularizar y organizar código eficientemente
- **Implementar** manejo de excepciones para crear programas robustos
- **Distinguir** entre diferentes tipos de errores y sus estrategias de manejo
- **Debuggear** programas utilizando técnicas de manejo de errores

### 🔧 Competencias técnicas
- Sintaxis correcta de declaración y llamada de funciones
- Manejo de parámetros posicionales, nombrados y opcionales
- Implementación de try-catch-finally para excepciones
- Creación de excepciones personalizadas
- Uso de funciones anónimas y de flecha
- Técnicas de debugging y logging

### 🚀 Competencias transversales
- Pensamiento modular y reutilización de código
- Manejo proactivo de errores y casos edge
- Diseño de APIs internas limpias y mantenibles
- Documentación efectiva de funciones

---

## 📋 Prerrequisitos

### ✅ Conocimientos previos necesarios
- **Módulo 04**: Estructuras de control (if, loops, switch)
- **Módulo 03**: Sintaxis básica (variables, operadores, tipos)
- **Conceptos básicos**: Flujo de programa, tipos de datos, operadores

### 🛠️ Herramientas requeridas
- Dart SDK instalado y configurado
- Editor de código con debugging (VS Code recomendado)
- Conocimiento básico de terminal/consola

---

## 🔧 1. Fundamentos de Funciones

### 🔍 ¿Qué son las funciones?

Las **funciones** son bloques de código **reutilizables** que realizan una tarea específica. Permiten **modularizar** el código, evitar repetición y crear programas más **organizados y mantenibles**.

### 🎯 Ventajas de usar funciones

```dart
// ❌ SIN FUNCIONES (código repetitivo)
double area1 = 3.1416 * 5 * 5;        // Círculo 1
double area2 = 3.1416 * 3 * 3;        // Círculo 2
double area3 = 3.1416 * 7 * 7;        // Círculo 3

// ✅ CON FUNCIONES (código reutilizable)
double calcularAreaCirculo(double radio) {
  return 3.1416 * radio * radio;
}

double area1 = calcularAreaCirculo(5);   // Más claro
double area2 = calcularAreaCirculo(3);   // Más mantenible
double area3 = calcularAreaCirculo(7);   // Menos errores
```

### 📝 Anatomía de una función

```dart
// Función completa con documentación
/// Calcula el área de un círculo dado su radio
/// 
/// [radio] debe ser un número positivo
/// Retorna el área como double
double calcularAreaCirculo(double radio) {
  // Validación de entrada
  if (radio < 0) {
    throw ArgumentError('El radio no puede ser negativo');
  }
  
  // Cálculo y retorno
  const double pi = 3.1416;
  return pi * radio * radio;
}
```

---

## 📐 2. Tipos de Funciones

### 📍 2.1 Función Simple (void)

Realizan una acción pero **no retornan** un valor.

```dart
// Función que imprime un saludo
void saludar(String nombre) {
  print("¡Hola, $nombre! Bienvenido/a");
}

// Función que imprime una tabla de multiplicar
void imprimirTabla(int numero) {
  print("Tabla del $numero:");
  for (int i = 1; i <= 10; i++) {
    print("$numero x $i = ${numero * i}");
  }
}

// Uso de las funciones
void main() {
  saludar("Ana");           // ¡Hola, Ana! Bienvenido/a
  imprimirTabla(7);         // Imprime tabla del 7
}
```

### 📍 2.2 Función con Retorno

Realizan un cálculo y **devuelven** un resultado.

```dart
// Función que retorna un valor calculado
int sumar(int a, int b) {
  return a + b;
}

// Función que retorna un booleano
bool esPar(int numero) {
  return numero % 2 == 0;
}

// Función que retorna un String
String obtenerCalificacion(double promedio) {
  if (promedio >= 90) return "A";
  if (promedio >= 80) return "B";
  if (promedio >= 70) return "C";
  if (promedio >= 60) return "D";
  return "F";
}

// Uso en main
void main() {
  int resultado = sumar(5, 3);                    // 8
  bool par = esPar(4);                           // true
  String calificacion = obtenerCalificacion(85); // "B"
  
  print("Resultado: $resultado, Es par: $par, Calificación: $calificacion");
}
```

### 📍 2.3 Funciones de Flecha (Arrow Functions)

Para funciones **simples de una línea**.

```dart
// Sintaxis tradicional vs función de flecha
// Tradicional
double areaCirculo1(double radio) {
  return 3.1416 * radio * radio;
}

// Función de flecha (más concisa)
double areaCirculo2(double radio) => 3.1416 * radio * radio;

// Más ejemplos de funciones de flecha
int cuadrado(int n) => n * n;
bool esMayorDeEdad(int edad) => edad >= 18;
String formatearNombre(String nombre) => nombre.trim().toLowerCase();
double celsiusAFahrenheit(double celsius) => (celsius * 9/5) + 32;

void main() {
  print("Área: ${areaCirculo2(5)}");              // Área: 78.54
  print("Cuadrado: ${cuadrado(4)}");              // Cuadrado: 16
  print("Mayor de edad: ${esMayorDeEdad(20)}");   // Mayor de edad: true
  print("Temperatura: ${celsiusAFahrenheit(25)}"); // Temperatura: 77.0
}
```

---

## 📋 3. Parámetros de Funciones

### 📍 3.1 Parámetros Posicionales Obligatorios

Los parámetros se pasan **en orden específico** y son **requeridos**.

```dart
// Función con parámetros posicionales
double calcularAreaRectangulo(double largo, double ancho) {
  return largo * ancho;
}

// Función para calcular promedio
double calcularPromedio(double nota1, double nota2, double nota3) {
  return (nota1 + nota2 + nota3) / 3;
}

void main() {
  // El orden importa
  double area = calcularAreaRectangulo(10.0, 5.0);  // largo=10, ancho=5
  double promedio = calcularPromedio(85, 92, 78);   // orden específico
  
  print("Área: $area");           // Área: 50.0
  print("Promedio: $promedio");   // Promedio: 85.0
}
```

### 📍 3.2 Parámetros Opcionales Posicionales

Se encierran en **corchetes []** y pueden tener **valores por defecto**.

```dart
// Función con parámetros opcionales
String construirSaludo(String nombre, [String? apellido, String tratamiento = "Sr./Sra."]) {
  String nombreCompleto = apellido != null ? "$nombre $apellido" : nombre;
  return "$tratamiento $nombreCompleto";
}

// Función para calcular potencia con exponente opcional
double potencia(double base, [int exponente = 2]) {
  double resultado = 1;
  for (int i = 0; i < exponente; i++) {
    resultado *= base;
  }
  return resultado;
}

void main() {
  // Diferentes formas de llamar la función
  print(construirSaludo("Ana"));                    // Sr./Sra. Ana
  print(construirSaludo("Carlos", "Pérez"));        // Sr./Sra. Carlos Pérez
  print(construirSaludo("María", "López", "Dra.")); // Dra. María López
  
  print("Cuadrado: ${potencia(3)}");      // Cuadrado: 9.0
  print("Cubo: ${potencia(3, 3)}");       // Cubo: 27.0
  print("Cuarta: ${potencia(2, 4)}");     // Cuarta: 16.0
}
```

### 📍 3.3 Parámetros Nombrados

Se encierran en **llaves {}** y se llaman **por nombre**.

```dart
// Función con parámetros nombrados
void configurarUsuario({
  required String nombre,     // Requerido
  required String email,      // Requerido
  int edad = 18,             // Opcional con valor por defecto
  bool esActivo = true,      // Opcional con valor por defecto
  String? telefono,          // Opcional nullable
}) {
  print("=== CONFIGURACIÓN DE USUARIO ===");
  print("Nombre: $nombre");
  print("Email: $email");
  print("Edad: $edad años");
  print("Estado: ${esActivo ? 'Activo' : 'Inactivo'}");
  if (telefono != null) {
    print("Teléfono: $telefono");
  }
  print("");
}

// Función para crear rectángulo con parámetros nombrados
double crearRectangulo({
  required double largo,
  required double ancho,
  bool mostrarInfo = false,
}) {
  double area = largo * ancho;
  
  if (mostrarInfo) {
    print("Rectángulo: ${largo}x${ancho} = $area");
  }
  
  return area;
}

void main() {
  // Llamadas con parámetros nombrados (orden flexible)
  configurarUsuario(
    nombre: "Ana García",
    email: "ana@email.com",
  );
  
  configurarUsuario(
    email: "carlos@email.com",    // Orden diferente
    nombre: "Carlos López",
    edad: 25,
    telefono: "555-1234",
  );
  
  // Rectángulos con parámetros nombrados
  double area1 = crearRectangulo(largo: 10, ancho: 5);
  double area2 = crearRectangulo(
    ancho: 8, 
    largo: 6, 
    mostrarInfo: true
  );
}
```

### 📍 3.4 Combinando Tipos de Parámetros

```dart
// Función que combina diferentes tipos de parámetros
String formatearTexto(
  String texto,                    // Posicional requerido
  [String? prefijo],              // Posicional opcional
  {
    bool mayusculas = false,       // Nombrado opcional
    bool eliminarEspacios = false, // Nombrado opcional
    required String sufijo,        // Nombrado requerido
  }
) {
  String resultado = texto;
  
  // Aplicar transformaciones
  if (eliminarEspacios) {
    resultado = resultado.replaceAll(' ', '');
  }
  
  if (mayusculas) {
    resultado = resultado.toUpperCase();
  }
  
  // Agregar prefijo y sufijo
  if (prefijo != null) {
    resultado = "$prefijo$resultado";
  }
  resultado = "$resultado$sufijo";
  
  return resultado;
}

void main() {
  // Diferentes formas de llamar la función
  String texto1 = formatearTexto("Hola Mundo", sufijo: "!");
  print(texto1); // "Hola Mundo!"
  
  String texto2 = formatearTexto(
    "Hola Mundo", 
    ">>> ",
    sufijo: " <<<",
    mayusculas: true,
  );
  print(texto2); // ">>> HOLA MUNDO <<<"
  
  String texto3 = formatearTexto(
    "Hola Mundo",
    sufijo: "_final",
    eliminarEspacios: true,
    mayusculas: true,
  );
  print(texto3); // "HOLAMUNDO_final"
}
```

---

## ⚠️ 4. Manejo de Errores y Excepciones

### 🔍 ¿Qué son las excepciones?

Las **excepciones** son eventos que interrumpen el **flujo normal** del programa debido a errores o situaciones inesperadas. El **manejo adecuado** de excepciones hace que nuestros programas sean más **robustos y confiables**.

### 📍 4.1 Try-Catch Básico

```dart
import 'dart:io';

// Función que puede generar excepción
double dividir(double a, double b) {
  if (b == 0) {
    throw Exception('No se puede dividir por cero');
  }
  return a / b;
}

void main() {
  // Manejo básico de excepciones
  try {
    double resultado = dividir(10, 0);
    print("Resultado: $resultado");
  } catch (e) {
    print("Error capturado: $e");
  }
  
  // El programa continúa normalmente
  print("El programa sigue ejecutándose");
}
```

### 📍 4.2 Try-Catch-Finally Completo

```dart
import 'dart:io';
import 'dart:math';

// Simulación de lectura de archivo
String leerArchivo(String nombre) {
  // Simular diferentes tipos de errores
  Random random = Random();
  int errorType = random.nextInt(4);
  
  switch (errorType) {
    case 0:
      return "Contenido del archivo $nombre";
    case 1:
      throw FileSystemException("Archivo no encontrado", nombre);
    case 2:
      throw FormatException("Formato de archivo inválido");
    case 3:
      throw Exception("Error de permisos");
    default:
      return "Contenido por defecto";
  }
}

void procesarArchivo(String nombreArchivo) {
  print("\n=== Procesando archivo: $nombreArchivo ===");
  
  try {
    // Código que puede fallar
    print("Intentando leer archivo...");
    String contenido = leerArchivo(nombreArchivo);
    print("✅ Archivo leído exitosamente: $contenido");
    
    // Más operaciones que pueden fallar
    print("Procesando contenido...");
    if (contenido.length < 10) {
      throw FormatException("Contenido muy corto");
    }
    print("✅ Contenido procesado correctamente");
    
  } on FileSystemException catch (e) {
    // Manejo específico para errores de archivo
    print("❌ Error de archivo: ${e.message}");
    print("💡 Sugerencia: Verifique que el archivo exista");
    
  } on FormatException catch (e) {
    // Manejo específico para errores de formato
    print("❌ Error de formato: ${e.message}");
    print("💡 Sugerencia: Revise el formato del archivo");
    
  } catch (e) {
    // Manejo genérico para otros errores
    print("❌ Error inesperado: $e");
    print("💡 Sugerencia: Contacte al administrador");
    
  } finally {
    // Código que SIEMPRE se ejecuta
    print("🔧 Liberando recursos...");
    print("📋 Proceso de archivo completado\n");
  }
}

void main() {
  // Probar el manejo de diferentes errores
  for (int i = 0; i < 3; i++) {
    procesarArchivo("archivo_$i.txt");
  }
}
```

### 📍 4.3 Excepciones Personalizadas

```dart
// Definir excepciones personalizadas
class EdadInvalidaException implements Exception {
  final String message;
  final int edadIngresada;
  
  EdadInvalidaException(this.message, this.edadIngresada);
  
  @override
  String toString() => 'EdadInvalidaException: $message (Edad: $edadIngresada)';
}

class EmailInvalidoException implements Exception {
  final String email;
  
  EmailInvalidoException(this.email);
  
  @override
  String toString() => 'EmailInvalidoException: Email inválido "$email"';
}

// Funciones con validación y excepciones personalizadas
void validarEdad(int edad) {
  if (edad < 0) {
    throw EdadInvalidaException("La edad no puede ser negativa", edad);
  }
  if (edad > 150) {
    throw EdadInvalidaException("La edad no puede ser mayor a 150", edad);
  }
}

void validarEmail(String email) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    throw EmailInvalidoException(email);
  }
}

// Función que registra usuario con validaciones
bool registrarUsuario(String nombre, int edad, String email) {
  try {
    // Validaciones que pueden lanzar excepciones
    if (nombre.trim().isEmpty) {
      throw ArgumentError("El nombre no puede estar vacío");
    }
    
    validarEdad(edad);
    validarEmail(email);
    
    // Si llegamos aquí, todos los datos son válidos
    print("✅ Usuario registrado exitosamente:");
    print("   Nombre: $nombre");
    print("   Edad: $edad");
    print("   Email: $email");
    return true;
    
  } on EdadInvalidaException catch (e) {
    print("❌ Error de edad: $e");
    return false;
    
  } on EmailInvalidoException catch (e) {
    print("❌ Error de email: $e");
    return false;
    
  } on ArgumentError catch (e) {
    print("❌ Error de argumento: ${e.message}");
    return false;
    
  } catch (e) {
    print("❌ Error inesperado: $e");
    return false;
  }
}

void main() {
  // Probar diferentes casos
  print("=== PRUEBAS DE REGISTRO DE USUARIO ===\n");
  
  // Caso exitoso
  registrarUsuario("Ana García", 25, "ana@email.com");
  print("");
  
  // Casos con errores
  registrarUsuario("", 25, "ana@email.com");           // Nombre vacío
  registrarUsuario("Carlos", -5, "carlos@email.com");  // Edad negativa
  registrarUsuario("María", 200, "maria@email.com");   // Edad muy alta
  registrarUsuario("Luis", 30, "email_invalido");      // Email inválido
}
```

### 📍 4.4 Funciones Seguras con Validación

```dart
import 'dart:math';

// Función segura para operaciones matemáticas
class ResultadoOperacion {
  final double? valor;
  final bool exitoso;
  final String? error;
  
  ResultadoOperacion.exitoso(this.valor) : exitoso = true, error = null;
  ResultadoOperacion.error(this.error) : valor = null, exitoso = false;
}

class CalculadoraSegura {
  // División segura
  static ResultadoOperacion dividir(double a, double b) {
    try {
      if (b == 0) {
        return ResultadoOperacion.error("División por cero no permitida");
      }
      
      double resultado = a / b;
      
      // Verificar resultados especiales
      if (resultado.isInfinite) {
        return ResultadoOperacion.error("Resultado infinito");
      }
      if (resultado.isNaN) {
        return ResultadoOperacion.error("Resultado no es un número");
      }
      
      return ResultadoOperacion.exitoso(resultado);
    } catch (e) {
      return ResultadoOperacion.error("Error inesperado: $e");
    }
  }
  
  // Raíz cuadrada segura
  static ResultadoOperacion raizCuadrada(double numero) {
    try {
      if (numero < 0) {
        return ResultadoOperacion.error("No se puede calcular raíz cuadrada de número negativo");
      }
      
      double resultado = sqrt(numero);
      return ResultadoOperacion.exitoso(resultado);
    } catch (e) {
      return ResultadoOperacion.error("Error al calcular raíz: $e");
    }
  }
  
  // Logaritmo seguro
  static ResultadoOperacion logaritmo(double numero) {
    try {
      if (numero <= 0) {
        return ResultadoOperacion.error("El logaritmo requiere un número positivo");
      }
      
      double resultado = log(numero);
      return ResultadoOperacion.exitoso(resultado);
    } catch (e) {
      return ResultadoOperacion.error("Error al calcular logaritmo: $e");
    }
  }
}

void main() {
  print("=== CALCULADORA SEGURA ===\n");
  
  // Función auxiliar para mostrar resultados
  void mostrarResultado(String operacion, ResultadoOperacion resultado) {
    if (resultado.exitoso) {
      print("✅ $operacion = ${resultado.valor}");
    } else {
      print("❌ $operacion: ${resultado.error}");
    }
  }
  
  // Pruebas de división
  mostrarResultado("10 ÷ 2", CalculadoraSegura.dividir(10, 2));
  mostrarResultado("10 ÷ 0", CalculadoraSegura.dividir(10, 0));
  mostrarResultado("0 ÷ 0", CalculadoraSegura.dividir(0, 0));
  
  print("");
  
  // Pruebas de raíz cuadrada
  mostrarResultado("√16", CalculadoraSegura.raizCuadrada(16));
  mostrarResultado("√25", CalculadoraSegura.raizCuadrada(25));
  mostrarResultado("√-4", CalculadoraSegura.raizCuadrada(-4));
  
  print("");
  
  // Pruebas de logaritmo
  mostrarResultado("log(10)", CalculadoraSegura.logaritmo(10));
  mostrarResultado("log(1)", CalculadoraSegura.logaritmo(1));
  mostrarResultado("log(-1)", CalculadoraSegura.logaritmo(-1));
  mostrarResultado("log(0)", CalculadoraSegura.logaritmo(0));
}
```

---

## 🎯 5. Ejercicios Prácticos

### 🟢 Nivel Básico

#### **Ejercicio 1**: Calculadora de formas geométricas
Crea funciones para calcular:
- Área de círculo (π × radio²)
- Área de rectángulo (largo × ancho)  
- Área de triángulo (base × altura ÷ 2)
- Con validación de parámetros negativos

#### **Ejercicio 2**: Conversor de temperaturas
Implementa funciones para convertir:
- Celsius a Fahrenheit
- Fahrenheit a Celsius
- Celsius a Kelvin
- Con manejo de temperaturas bajo cero absoluto

#### **Ejercicio 3**: Validador de datos
Crea funciones que validen:
- Números de teléfono
- Direcciones de email
- Passwords (longitud, caracteres especiales)
- Con excepciones personalizadas

### 🟡 Nivel Intermedio

#### **Ejercicio 4**: Sistema de calificaciones
Desarrolla un sistema que:
- Calcule promedio de múltiples notas
- Determine letra de calificación (A, B, C, D, F)
- Maneje notas inválidas con excepciones
- Use parámetros nombrados para configuración

#### **Ejercicio 5**: Generador de reportes
Crea funciones que:
- Generen reportes de estudiantes
- Calculen estadísticas (promedio, máximo, mínimo)
- Formateen salida con parámetros opcionales
- Manejen listas vacías o datos inválidos

#### **Ejercicio 6**: Calculadora científica
Implementa operaciones avanzadas:
- Potenciación y radicación
- Funciones trigonométricas
- Logaritmos y exponenciales
- Con manejo robusto de errores matemáticos

### 🔴 Nivel Avanzado

#### **Ejercicio 7**: Parser de expresiones matemáticas
Desarrolla un evaluador que:
- Parse expresiones como "2 + 3 * 4"
- Respete precedencia de operadores
- Maneje paréntesis anidados
- Lance excepciones por sintaxis inválida

#### **Ejercicio 8**: Sistema de validación complejo
Crea un validador que:
- Use múltiples estrategias de validación
- Combine validaciones con operadores lógicos
- Genere reportes detallados de errores
- Permita configuración flexible de reglas

#### **Ejercicio 9**: Simulador de operaciones bancarias
Implementa un sistema que:
- Maneje cuentas bancarias con saldos
- Procese depósitos, retiros y transferencias
- Valide fondos suficientes y límites
- Log todas las operaciones con timestamps

---

## ✅ Criterios de Evaluación

### 🎯 Comprensión de Funciones (35%)
- [ ] Declara funciones con sintaxis correcta
- [ ] Usa tipos apropiados de parámetros y retorno
- [ ] Modulariza código efectivamente con funciones
- [ ] Documenta funciones con comentarios útiles

### ⚠️ Manejo de Errores (30%)
- [ ] Implementa try-catch apropiadamente
- [ ] Crea excepciones personalizadas cuando es necesario
- [ ] Valida entrada de datos consistentemente
- [ ] Provee mensajes de error informativos

### 💻 Implementación Técnica (25%)
- [ ] Código funcional y libre de errores
- [ ] Uso eficiente de diferentes tipos de funciones
- [ ] Manejo correcto de casos edge y validaciones
- [ ] Aplicación apropiada de principios de programación

### 🏗️ Buenas Prácticas (10%)
- [ ] Código legible y bien estructurado
- [ ] Nombres descriptivos para funciones y variables
- [ ] Funciones con responsabilidad única
- [ ] Reutilización efectiva de código

---

## 🔧 Herramientas de Debugging

### 🐛 Técnicas de depuración con funciones

```dart
// 1. Logging en funciones
int sumarConLog(int a, int b) {
  print("DEBUG: Sumando $a + $b");
  int resultado = a + b;
  print("DEBUG: Resultado = $resultado");
  return resultado;
}

// 2. Función de debugging auxiliar
void debug(String mensaje, [dynamic valor]) {
  print("🐛 DEBUG: $mensaje${valor != null ? ' = $valor' : ''}");
}

// 3. Wrapper para capturar excepciones
T ejecutarConLog<T>(String operacion, T Function() funcion) {
  try {
    print("▶️ Iniciando: $operacion");
    T resultado = funcion();
    print("✅ Completado: $operacion");
    return resultado;
  } catch (e) {
    print("❌ Error en $operacion: $e");
    rethrow; // Re-lanzar la excepción
  }
}
```

---

## 📚 Recursos Complementarios

### 📖 Documentación Oficial
- [Dart Functions](https://dart.dev/guides/language/language-tour#functions)
- [Dart Exception Handling](https://dart.dev/guides/language/language-tour#exceptions)
- [Effective Dart - Functions](https://dart.dev/guides/language/effective-dart/design#functions)

### 🎥 Tutoriales Recomendados
- [Dart Functions Deep Dive](https://dart.dev/codelabs/dart-cheatsheet#functions)
- [Exception Handling Best Practices](https://dart.dev/guides/language/effective-dart/error-handling)

### 🛠️ Herramientas de Desarrollo
- [Dart DevTools](https://dart.dev/tools/dart-devtools) - Debugging avanzado
- [DartPad](https://dartpad.dev) - Práctica online
- [Dart Analyzer](https://dart.dev/tools/dart-analyze) - Análisis estático

---

## ⏰ Distribución del Tiempo de Clase

### 📅 Sesión 1 (90 minutos) - Fundamentos de Funciones
- **25 min**: Conceptos básicos y tipos de funciones
- **35 min**: Parámetros (posicionales, opcionales, nombrados)
- **25 min**: Ejercicios prácticos de funciones básicas
- **5 min**: Recap y preparación para siguiente sesión

### 📅 Sesión 2 (90 minutos) - Manejo de Errores
- **20 min**: Repaso de funciones y introducción a excepciones
- **40 min**: Try-catch-finally y excepciones personalizadas
- **25 min**: Ejercicios de manejo de errores
- **5 min**: Q&A y aclaraciones

### 📅 Sesión 3 (90 minutos) - Integración y Proyecto
- **15 min**: Repaso de conceptos clave
- **50 min**: Proyecto integrador (calculadora robusta)
- **20 min**: Debugging y mejores prácticas
- **5 min**: Evaluación y siguiente módulo

---

## 🎪 Actividades Complementarias

### 🏆 Desafíos de Programación
- **Code Golf**: Escribir la función más corta que resuelva un problema
- **Error Hunt**: Encontrar y corregir errores en código con bugs
- **Refactoring**: Mejorar código existente usando funciones

### 👥 Trabajo Colaborativo
- **Pair Programming**: Desarrollo de funciones en parejas
- **Code Review**: Revisión cruzada de ejercicios
- **API Design**: Diseñar interfaces de funciones para proyectos reales

---

**🎓 ¡Domina las funciones y el manejo de errores!**

*Las funciones son los bloques de construcción de programas complejos. El manejo apropiado de errores es la diferencia entre código amateur y profesional.*
