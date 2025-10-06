# 📚 04. Estructuras de Control en Dart

## 🎯 Objetivos de aprendizaje

Al completar este módulo, el estudiante será capaz de:

### 🎓 Objetivos principales
- **Comprender** el concepto y propósito de las estructuras de control
- **Aplicar** condicionales (if, else, switch) para tomar decisiones en el código
- **Implementar** bucles (for, while, do-while) para repetir operaciones
- **Combinar** múltiples estructuras de control en programas complejos
- **Optimizar** el flujo de ejecución usando las estructuras apropiadas
- **Debuggear** programas que utilizan estructuras de control anidadas

### 🔧 Competencias técnicas
- Sintaxis correcta de condicionales y bucles en Dart
- Uso de operadores de comparación y lógicos
- Control de flujo eficiente y legible
- Manejo de casos edge y validaciones
- Estructuras de control anidadas y complejas

### 🚀 Competencias transversales
- Pensamiento lógico y algorítmico
- Resolución de problemas paso a paso
- Análisis de casos y condiciones
- Optimización y refactoring de código

---

## 📋 Prerrequisitos

### ✅ Conocimientos previos necesarios
- **Módulo 03**: Sintaxis básica de Dart (variables, operadores, funciones)
- **Conceptos básicos**: Tipos de datos, operadores de comparación
- **Lógica básica**: Conceptos de verdadero/falso, condiciones

### 🛠️ Herramientas requeridas
- Dart SDK instalado y configurado
- Editor de código (VS Code recomendado)
- Terminal o consola para ejecutar programas

---

## 📖 1. Fundamentos de Estructuras de Control

### 🔍 ¿Qué son las estructuras de control?

Las **estructuras de control** son construcciones que permiten **alterar el flujo secuencial** de ejecución de un programa. Sin ellas, el código se ejecutaría línea por línea desde el inicio hasta el final, sin posibilidad de tomar decisiones o repetir acciones.

### 🎯 Tipos principales

```dart
// 1. SECUENCIAL (sin estructuras de control)
print("Línea 1");
print("Línea 2"); 
print("Línea 3");

// 2. CONDICIONAL (toma decisiones)
if (temperatura > 30) {
  print("Hace calor");
} else {
  print("Temperatura agradable");
}

// 3. REPETITIVA (repite acciones)
for (int i = 0; i < 3; i++) {
  print("Repetición $i");
}
```

---

## 🔀 2. Estructuras Condicionales

### 📍 2.1 Condicional Simple: `if`

La estructura `if` ejecuta un bloque de código **solo si** una condición es verdadera.

#### 📝 Sintaxis básica
```dart
if (condición) {
  // Código que se ejecuta si la condición es true
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Validación de edad
int edad = 18;
if (edad >= 18) {
  print("Eres mayor de edad");
}

// Ejemplo 2: Validación de entrada
String password = "123456";
if (password.length >= 8) {
  print("Contraseña segura");
}

// Ejemplo 3: Condición con operadores lógicos
bool esVIP = true;
double compra = 150.0;
if (esVIP && compra > 100) {
  print("Descuento aplicado");
}
```

### 📍 2.2 Condicional Completa: `if-else`

Permite ejecutar **diferentes bloques** según si la condición es verdadera o falsa.

#### 📝 Sintaxis
```dart
if (condición) {
  // Código si es verdadero
} else {
  // Código si es falso
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Par o impar
int numero = 7;
if (numero % 2 == 0) {
  print("$numero es par");
} else {
  print("$numero es impar");
}

// Ejemplo 2: Calificación
double nota = 85.5;
if (nota >= 70) {
  print("Aprobado con $nota");
} else {
  print("Reprobado con $nota");
}

// Ejemplo 3: Validación de login
String usuario = "admin";
String clave = "123";
if (usuario == "admin" && clave == "password") {
  print("Acceso concedido");
} else {
  print("Credenciales inválidas");
}
```

### 📍 2.3 Condicionales Múltiples: `if-else if-else`

Para evaluar **múltiples condiciones** en secuencia.

#### 📝 Sintaxis
```dart
if (condición1) {
  // Código para condición 1
} else if (condición2) {
  // Código para condición 2
} else if (condición3) {
  // Código para condición 3
} else {
  // Código por defecto
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Sistema de calificaciones
double promedio = 88.5;
if (promedio >= 90) {
  print("Calificación: A - Excelente");
} else if (promedio >= 80) {
  print("Calificación: B - Muy bueno");
} else if (promedio >= 70) {
  print("Calificación: C - Bueno");
} else if (promedio >= 60) {
  print("Calificación: D - Suficiente");
} else {
  print("Calificación: F - Reprobado");
}

// Ejemplo 2: Categorías por edad
int edad = 25;
if (edad < 13) {
  print("Categoría: Niño");
} else if (edad < 18) {
  print("Categoría: Adolescente");
} else if (edad < 60) {
  print("Categoría: Adulto");
} else {
  print("Categoría: Adulto mayor");
}
```

### 📍 2.4 Estructura Switch

Ideal para **múltiples casos específicos** de una misma variable.

#### 📝 Sintaxis
```dart
switch (variable) {
  case valor1:
    // Código para valor1
    break;
  case valor2:
    // Código para valor2
    break;
  default:
    // Código por defecto
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Días de la semana
int dia = 3;
switch (dia) {
  case 1:
    print("Lunes");
    break;
  case 2:
    print("Martes");
    break;
  case 3:
    print("Miércoles");
    break;
  case 4:
    print("Jueves");
    break;
  case 5:
    print("Viernes");
    break;
  case 6:
  case 7:
    print("Fin de semana");
    break;
  default:
    print("Día inválido");
}

// Ejemplo 2: Calculadora simple
String operacion = "+";
double a = 10, b = 5;
switch (operacion) {
  case "+":
    print("Resultado: ${a + b}");
    break;
  case "-":
    print("Resultado: ${a - b}");
    break;
  case "*":
    print("Resultado: ${a * b}");
    break;
  case "/":
    if (b != 0) {
      print("Resultado: ${a / b}");
    } else {
      print("Error: División por cero");
    }
    break;
  default:
    print("Operación no válida");
}
```

---

## 🔁 3. Estructuras Repetitivas (Bucles)

### 📍 3.1 Bucle For

Ideal cuando conoces **exactamente cuántas iteraciones** necesitas.

#### 📝 Sintaxis básica
```dart
for (inicialización; condición; incremento) {
  // Código a repetir
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Contar del 1 al 10
for (int i = 1; i <= 10; i++) {
  print("Número: $i");
}

// Ejemplo 2: Tabla de multiplicar
int numero = 7;
print("Tabla del $numero:");
for (int i = 1; i <= 10; i++) {
  print("$numero x $i = ${numero * i}");
}

// Ejemplo 3: Sumar números pares
int suma = 0;
for (int i = 2; i <= 20; i += 2) {
  suma += i;
  print("Sumando $i, total: $suma");
}

// Ejemplo 4: Contar hacia atrás
for (int i = 10; i >= 1; i--) {
  print("Cuenta regresiva: $i");
}
print("¡Despegue!");

// Ejemplo 5: For-in para colecciones
List<String> nombres = ["Ana", "Luis", "María"];
for (String nombre in nombres) {
  print("Hola, $nombre");
}
```

### 📍 3.2 Bucle While

Se ejecuta **mientras** una condición sea verdadera. Útil cuando no sabes exactamente cuántas iteraciones necesitas.

#### 📝 Sintaxis
```dart
while (condición) {
  // Código a repetir
  // Importante: modificar la variable de la condición
}
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Contar hasta un límite
int contador = 1;
while (contador <= 5) {
  print("Iteración $contador");
  contador++; // ¡Importante! Sin esto sería bucle infinito
}

// Ejemplo 2: Validación de entrada
import 'dart:io';
String? entrada;
while (entrada != "salir") {
  print("Escribe 'salir' para terminar:");
  entrada = stdin.readLineSync();
  print("Escribiste: $entrada");
}

// Ejemplo 3: Suma hasta llegar a un objetivo
int suma = 0;
int numero = 1;
while (suma < 50) {
  suma += numero;
  print("Sumando $numero, total: $suma");
  numero++;
}

// Ejemplo 4: Buscar en una lista
List<int> numeros = [2, 7, 3, 9, 1];
int buscado = 9;
int indice = 0;
bool encontrado = false;

while (indice < numeros.length && !encontrado) {
  if (numeros[indice] == buscado) {
    print("Número $buscado encontrado en posición $indice");
    encontrado = true;
  }
  indice++;
}

if (!encontrado) {
  print("Número $buscado no encontrado");
}
```

### 📍 3.3 Bucle Do-While

Similar a `while`, pero **garantiza al menos una ejecución** porque evalúa la condición al final.

#### 📝 Sintaxis
```dart
do {
  // Código a repetir (se ejecuta al menos una vez)
} while (condición);
```

#### 🔍 Ejemplos prácticos
```dart
// Ejemplo 1: Menú interactivo
import 'dart:io';
int opcion;
do {
  print("\n=== MENÚ ===");
  print("1. Saludar");
  print("2. Calcular");
  print("3. Salir");
  print("Elige una opción:");
  
  String? entrada = stdin.readLineSync();
  opcion = int.tryParse(entrada ?? "0") ?? 0;
  
  switch (opcion) {
    case 1:
      print("¡Hola!");
      break;
    case 2:
      print("2 + 2 = 4");
      break;
    case 3:
      print("¡Hasta luego!");
      break;
    default:
      print("Opción inválida");
  }
} while (opcion != 3);

// Ejemplo 2: Validación con garantía de ejecución
int numero;
do {
  print("Ingresa un número entre 1 y 10:");
  String? entrada = stdin.readLineSync();
  numero = int.tryParse(entrada ?? "0") ?? 0;
  
  if (numero < 1 || numero > 10) {
    print("Error: El número debe estar entre 1 y 10");
  }
} while (numero < 1 || numero > 10);

print("Perfecto! Elegiste: $numero");
```

---

## 🔄 4. Control de Flujo Avanzado

### 📍 4.1 Break y Continue

#### 🛑 Break - Salir del bucle
```dart
// Buscar el primer número par
for (int i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    print("Primer par encontrado: $i");
    break; // Sale del bucle completamente
  }
  print("Revisando: $i");
}
```

#### ⏭️ Continue - Saltar a la siguiente iteración
```dart
// Mostrar solo números impares
for (int i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    continue; // Salta el resto del código y va a la siguiente iteración
  }
  print("Número impar: $i");
}
```

### 📍 4.2 Estructuras Anidadas

```dart
// Ejemplo: Tabla de multiplicar múltiple
for (int tabla = 1; tabla <= 3; tabla++) {
  print("\n=== Tabla del $tabla ===");
  for (int multiplicador = 1; multiplicador <= 5; multiplicador++) {
    int resultado = tabla * multiplicador;
    print("$tabla x $multiplicador = $resultado");
  }
}

// Ejemplo: Validación con bucles anidados
bool datosValidos = false;
while (!datosValidos) {
  print("Ingresa tu edad:");
  String? entrada = stdin.readLineSync();
  int? edad = int.tryParse(entrada ?? "");
  
  if (edad != null && edad >= 0 && edad <= 120) {
    // Validación adicional anidada
    if (edad >= 18) {
      print("Acceso permitido - Mayor de edad");
      datosValidos = true;
    } else {
      print("Acceso denegado - Menor de edad");
      datosValidos = true;
    }
  } else {
    print("Error: Edad inválida. Intenta nuevamente.");
  }
}
```

---

## 🎯 5. Ejercicios Prácticos

### 🟢 Nivel Básico

#### **Ejercicio 1**: Clasificador de números
Escribe un programa que lea un número y determine si es:
- Positivo, negativo o cero
- Par o impar (si no es cero)

#### **Ejercicio 2**: Contador simple
Crea un programa que cuente del 1 al 15, pero:
- Imprima "Fizz" en lugar de números divisibles por 3
- Imprima "Buzz" en lugar de números divisibles por 5

#### **Ejercicio 3**: Calculadora de promedio
Programa que calcule el promedio de 5 calificaciones y determine si el estudiante:
- Aprobó (promedio >= 70)
- Reprobó (promedio < 70)

### 🟡 Nivel Intermedio

#### **Ejercicio 4**: Adivina el número
Juego donde:
- El programa piensa un número del 1 al 100
- El usuario tiene 7 intentos para adivinarlo
- Se dan pistas "mayor" o "menor"

#### **Ejercicio 5**: Factorial
Calcula el factorial de un número usando:
- Bucle for
- Bucle while
- Compara los resultados

#### **Ejercicio 6**: Menú interactivo
Crea un programa con menú que permita:
- Sumar dos números
- Restar dos números
- Multiplicar dos números
- Dividir dos números (validar división por cero)
- Salir del programa

### 🔴 Nivel Avanzado

#### **Ejercicio 7**: Números primos
Programa que encuentre todos los números primos entre 1 y 100.

#### **Ejercicio 8**: Patrón de asteriscos
Dibuja un triángulo de asteriscos:
```
*
**
***
****
*****
```

#### **Ejercicio 9**: Validador de entrada robusto
Sistema que valide entrada de usuario con:
- Múltiples intentos
- Mensajes de error específicos
- Diferentes tipos de validación

---

## ✅ Criterios de Evaluación

### 🎯 Comprensión Conceptual (30%)
- [ ] Explica correctamente cuándo usar cada estructura de control
- [ ] Identifica la estructura más apropiada para cada problema
- [ ] Comprende el flujo de ejecución en estructuras anidadas

### 💻 Implementación Técnica (40%)
- [ ] Sintaxis correcta en todas las estructuras
- [ ] Uso apropiado de operadores de comparación y lógicos
- [ ] Manejo correcto de casos edge y validaciones
- [ ] Código funcional y sin errores lógicos

### 🏗️ Buenas Prácticas (20%)
- [ ] Código legible y bien estructurado
- [ ] Nombres de variables descriptivos
- [ ] Comentarios útiles en lógica compleja
- [ ] Evita bucles infinitos y condiciones innecesarias

### 🚀 Resolución de Problemas (10%)
- [ ] Enfoque lógico para descomponer problemas
- [ ] Soluciones eficientes y elegantes
- [ ] Capacidad de debuggear y corregir errores
- [ ] Creatividad en implementaciones alternativas

---

## 🔧 Herramientas de Debugging

### 🐛 Técnicas comunes de depuración

```dart
// 1. Usar print() para seguir el flujo
int contador = 0;
while (contador < 5) {
  print("DEBUG: contador = $contador"); // Debugging line
  // Lógica del programa
  contador++;
}

// 2. Validar condiciones complejas
bool condicionCompleja = (a > b) && (c < d) || (e == f);
print("DEBUG: condición = $condicionCompleja"); // Ver resultado

// 3. Verificar bucles infinitos
int iteracion = 0;
while (true) {
  iteracion++;
  if (iteracion > 1000) {
    print("WARNING: Posible bucle infinito detectado");
    break;
  }
  // Lógica del bucle
}
```

---

## 📚 Recursos Complementarios

### 📖 Documentación Oficial
- [Dart Language Tour - Control Flow](https://dart.dev/guides/language/language-tour#control-flow-statements)
- [Effective Dart - Style Guide](https://dart.dev/guides/language/effective-dart/style)

### 🎥 Tutoriales Recomendados
- [Dart Control Flow Statements](https://dart.dev/codelabs/dart-cheatsheet#control-flow-statements)
- [Loops in Dart](https://dart.dev/guides/language/language-tour#for-loops)

### 🛠️ Herramientas Práticas
- [DartPad](https://dartpad.dev) - Para probar código online
- [Dart Analyzer](https://dart.dev/tools/dart-analyze) - Análisis estático de código

---

## ⏰ Distribución del Tiempo de Clase

### 📅 Sesión 1 (90 minutos)
- **20 min**: Introducción y conceptos fundamentales
- **30 min**: Condicionales (if, else, switch) con ejemplos
- **30 min**: Ejercicios prácticos de condicionales
- **10 min**: Recap y Q&A

### 📅 Sesión 2 (90 minutos)
- **15 min**: Repaso de condicionales
- **35 min**: Bucles (for, while, do-while) con ejemplos
- **30 min**: Ejercicios prácticos de bucles
- **10 min**: Estructuras anidadas y mejores prácticas

### 📅 Sesión 3 (90 minutos)
- **20 min**: Control de flujo avanzado (break, continue)
- **40 min**: Proyecto integrador combinando todas las estructuras
- **20 min**: Debugging y resolución de problemas
- **10 min**: Evaluación y siguiente módulo

---

**🎓 ¡Éxito en el aprendizaje de estructuras de control!**

*Las estructuras de control son la base del pensamiento algorítmico. Domínalas y podrás resolver cualquier problema computacional.*
