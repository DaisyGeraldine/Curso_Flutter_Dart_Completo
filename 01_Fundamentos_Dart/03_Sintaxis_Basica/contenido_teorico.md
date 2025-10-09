# 03. Sintaxis básica de Dart

## 🎯 Objetivos de aprendizaje

Al finalizar esta lección, los estudiantes serán capaces de:
- Declarar y utilizar variables con diferentes tipos de datos
- Aplicar operadores aritméticos, lógicos y de comparación
- Escribir comentarios efectivos en el código
- Comprender las convenciones de nomenclatura de Dart
- Crear programas simples utilizando la sintaxis básica

## 📋 Requisitos previos

- Dart SDK instalado y configurado
- Editor de código (VS Code recomendado)
- Conocimientos básicos de programación (opcional pero útil)
- Comprensión de conceptos básicos de variables y tipos de datos

## 📚 Contenido teórico

### 1. Introducción a la sintaxis de Dart

**Dart** es un lenguaje de programación moderno, orientado a objetos, desarrollado por Google. Su sintaxis es similar a Java, C# y JavaScript, lo que facilita su aprendizaje.

#### Características clave:
- **Tipado fuerte**: Detecta errores en tiempo de compilación
- **Inferencia de tipos**: El compilador deduce tipos automáticamente
- **Null safety**: Previene errores de referencia nula
- **Sintaxis limpia**: Código legible y expresivo

### 2. Variables y tipos de datos

#### 2.1 Declaración de variables

En Dart, puedes declarar variables de varias formas:

```dart
// Declaración explícita del tipo
int edad = 25;
String nombre = "María";

// Inferencia de tipo con 'var'
var altura = 1.75;  // Dart infiere que es double
var activo = true;  // Dart infiere que es bool

// Declaración sin inicialización
int? puntuacion;  // Nullable int
String apellido;  // Error: debe inicializarse

// Constantes
final fechaNacimiento = DateTime.now();  // Valor asignado en tiempo de ejecución
const pi = 3.14159;                     // Valor conocido en tiempo de compilación
```

#### 2.2 Tipos de datos fundamentales

| Tipo | Descripción | Ejemplo | Rango/Características |
|------|-------------|---------|----------------------|
| `int` | Números enteros | `42`, `-17`, `0` | -2⁶³ a 2⁶³-1 |
| `double` | Números decimales | `3.14`, `-0.5`, `2.0` | IEEE 754 double-precision |
| `num` | Superclase de int y double | `42` o `3.14` | Acepta enteros y decimales |
| `String` | Cadenas de texto | `"Hola"`, `'Mundo'` | UTF-16 |
| `bool` | Valores booleanos | `true`, `false` | Solo dos valores |
| `List` | Listas/Arrays | `[1, 2, 3]` | Colección ordenada |
| `Map` | Diccionarios | `{'clave': 'valor'}` | Pares clave-valor |
| `Set` | Conjuntos | `{1, 2, 3}` | Colección sin duplicados |

#### 2.3 Null Safety

Dart implementa null safety para prevenir errores de referencia nula:

```dart
// Tipo no nullable (no puede ser null)
String nombre = "Ana";  // ✅ Correcto
// nombre = null;       // ❌ Error de compilación

// Tipo nullable (puede ser null)
String? apellido;       // ✅ Puede ser null
apellido = null;        // ✅ Correcto
apellido = "García";    // ✅ Correcto

// Verificación antes de usar
if (apellido != null) {
  print(apellido.length);  // ✅ Seguro
}

// Operador de aserción (!)
print(apellido!.length);   // ⚠️ Peligroso si apellido es null

// Operador de acceso condicional (?.)
print(apellido?.length);   // ✅ Devuelve null si apellido es null
```

### 3. Operadores

#### 3.1 Operadores aritméticos

```dart
int a = 10, b = 3;

print(a + b);    // 13 - Suma
print(a - b);    // 7  - Resta
print(a * b);    // 30 - Multiplicación
print(a / b);    // 3.3333... - División (resultado double)
print(a ~/ b);   // 3  - División entera
print(a % b);    // 1  - Módulo (resto)

// Operadores de incremento/decremento
a++;             // a = a + 1
++a;             // Preincremento
a--;             // a = a - 1
--a;             // Predecremento
```

#### 3.2 Operadores de comparación

```dart
int x = 5, y = 10;

print(x == y);   // false - Igual
print(x != y);   // true  - Diferente
print(x < y);    // true  - Menor que
print(x > y);    // false - Mayor que
print(x <= y);   // true  - Menor o igual
print(x >= y);   // false - Mayor o igual
```

#### 3.3 Operadores lógicos

```dart
bool a = true, b = false;

print(!a);       // false - NOT (negación)
print(a && b);   // false - AND (y lógico)
print(a || b);   // true  - OR (o lógico)
```

#### 3.4 Operadores de asignación

```dart
int numero = 10;

numero += 5;     // numero = numero + 5  (15)
numero -= 3;     // numero = numero - 3  (12)
numero *= 2;     // numero = numero * 2  (24)
numero ~/= 4;    // numero = numero ~/ 4 (6)
numero %= 4;     // numero = numero % 4  (2)

// Operador de asignación condicional
String? nombre;
nombre ??= "Anónimo";  // Solo asigna si nombre es null
```

#### 3.5 Operadores especiales de Dart

```dart
// Operador de cascada (..)
var lista = <int>[]
  ..add(1)
  ..add(2)
  ..add(3);

// Operador condicional ternario
int edad = 17;
String mensaje = edad >= 18 ? "Mayor de edad" : "Menor de edad";

// Operador null-coalescing (??)
String? nombre;
String nombreFinal = nombre ?? "Sin nombre";
```

### 4. Comentarios

#### 4.1 Tipos de comentarios

```dart
// Comentario de una sola línea
// Se usa para explicaciones breves

/*
  Comentario de múltiples líneas
  Útil para explicaciones más extensas
  o para comentar bloques de código
*/

/// Comentario de documentación
/// Se usa para documentar funciones, clases y métodos
/// Aparece en la documentación generada
void miFuncion() {
  // Implementación
}
```

#### 4.2 Buenas prácticas para comentarios

```dart
// ✅ Bueno: Explica el "por qué"
// Calculamos el IVA porque es requerido por ley
double iva = precio * 0.21;

// ❌ Malo: Explica el "qué" (obvio)
// Multiplica precio por 0.21
double iva = precio * 0.21;

// ✅ Bueno: Documenta parámetros complejos
/// Calcula el precio final incluyendo impuestos
/// [precioBase] - Precio sin impuestos
/// [tasaImpuesto] - Tasa de impuesto (0.0 - 1.0)
double calcularPrecioFinal(double precioBase, double tasaImpuesto) {
  return precioBase * (1 + tasaImpuesto);
}
```

### 5. Convenciones de nomenclatura

```dart
// Variables y funciones: lowerCamelCase
String nombreCompleto = "Juan Pérez";
int calcularEdad() => 2024 - 1990;

// Clases: UpperCamelCase
class PersonaUsuario {
  // Propiedades privadas: _ + lowerCamelCase
  String _nombrePrivado;
  
  // Constantes: lowerCamelCase o SCREAMING_SNAKE_CASE
  static const double pi = 3.14159;
  static const String API_URL = "https://api.ejemplo.com";
}

// Archivos: snake_case
// usuario_servicio.dart
// calculadora_impuestos.dart
```

### 6. Estructura básica de un programa Dart

```dart
// Importaciones (si las hay)
import 'dart:math';

// Función principal (punto de entrada)
void main() {
  // Declaración de variables
  String saludo = "¡Hola, Dart!";
  int numero = 42;
  
  // Operaciones
  print(saludo);
  print("El número es: $numero");
  
  // Llamada a funciones
  calcular();
}

// Funciones adicionales
void calcular() {
  int resultado = 5 + 3;
  print("Resultado: $resultado");
}
```

## 🛠️ Ejercicios prácticos

### Ejercicio 1: Variables y tipos básicos

**Objetivo**: Practicar la declaración y uso de variables con diferentes tipos.

**Instrucciones**:
1. Declara variables de cada tipo básico (int, double, String, bool)
2. Asigna valores apropiados a cada una
3. Muestra los valores en consola usando `print()`
4. Usa interpolación de strings para crear mensajes descriptivos

**Ejemplo esperado**:
```
Nombre: Ana García
Edad: 25 años
Altura: 1.68 metros
Es estudiante: true
```

### Ejercicio 2: Operaciones aritméticas

**Objetivo**: Implementar una calculadora simple que realice operaciones básicas.

**Instrucciones**:
1. Declara dos variables numéricas
2. Realiza todas las operaciones aritméticas básicas
3. Muestra los resultados con formato legible
4. Incluye división entera y módulo

### Ejercicio 3: Operadores lógicos y condicionales

**Objetivo**: Practicar el uso de operadores lógicos y condicionales.

**Instrucciones**:
1. Declara variables booleanas
2. Usa operadores lógicos (&&, ||, !)
3. Implementa lógica condicional con el operador ternario
4. Maneja valores nullable con operadores especiales

### Ejercicio 4: Interpolación y formateo de strings

**Objetivo**: Dominar la manipulación y formateo de cadenas.

**Instrucciones**:
1. Crea un programa que genere un "perfil de usuario"
2. Usa interpolación de strings (`$variable` y `${expresión}`)
3. Combina diferentes tipos de datos en un mensaje
4. Incluye cálculos dentro de la interpolación

## ✅ Criterios de evaluación

### Para el estudiante:

**Conocimiento básico (25%)**:
- [ ] Identifica correctamente tipos de datos
- [ ] Declara variables apropiadamente
- [ ] Comprende null safety

**Aplicación práctica (50%)**:
- [ ] Usa operadores correctamente
- [ ] Implementa operaciones aritméticas
- [ ] Maneja interpolación de strings
- [ ] Escribe código que funciona sin errores

**Buenas prácticas (25%)**:
- [ ] Sigue convenciones de nomenclatura
- [ ] Escribe comentarios útiles
- [ ] Código limpio y legible

### Para el profesor - Rúbrica detallada:

| Criterio | Excelente (4) | Bueno (3) | Satisfactorio (2) | Necesita mejora (1) |
|----------|---------------|-----------|-------------------|--------------------|
| **Declaración de variables** | Usa tipos apropiados y null safety correctamente | Declara variables correctamente con ayuda menor | Declara variables básicas | Errores en declaración |
| **Uso de operadores** | Aplica todos los operadores apropiadamente | Usa operadores básicos correctamente | Usa operadores con ayuda | Confusión con operadores |
| **Sintaxis** | Código perfecto sin errores | Errores menores que no afectan funcionalidad | Algunos errores de sintaxis | Múltiples errores de sintaxis |
| **Comentarios** | Comentarios útiles y bien escritos | Comentarios básicos apropiados | Pocos comentarios | Sin comentarios o inadecuados |

## 🔧 Herramientas y comandos útiles

### Comandos para práctica:

```bash
# Crear archivo Dart
echo 'void main() { print("¡Hola, Dart!"); }' > ejercicio.dart

# Ejecutar archivo Dart
dart run ejercicio.dart

# Compilar a ejecutable
dart compile exe ejercicio.dart

# Analizar código
dart analyze ejercicio.dart

# Formatear código
dart format ejercicio.dart
```

### VS Code - Atajos útiles:

- `Ctrl + Shift + P`: Paleta de comandos
- `F5`: Ejecutar con debugger
- `Alt + Shift + F`: Formatear documento
- `Ctrl + Space`: Autocompletado

## 📖 Recursos de referencia

### Documentación oficial:
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Dart API Reference](https://api.dart.dev/)

### Herramientas online:
- [DartPad](https://dartpad.dev/) - Editor online para practicar
- [Dart SDK Downloads](https://dart.dev/get-dart)

## 🚨 Errores comunes y soluciones

### Error: "The non-nullable variable must be assigned"
```dart
// ❌ Problemático
String nombre;  // Error: debe inicializarse

// ✅ Soluciones
String nombre = "";          // Inicializar con valor vacío
String? nombre;             // Hacer nullable
late String nombre;         // Inicialización tardía
```

### Error: "Null check operator used on null value"
```dart
// ❌ Problemático
String? nombre;
print(nombre!.length);  // Error si nombre es null

// ✅ Solución
if (nombre != null) {
  print(nombre.length);
}
// O usar el operador seguro
print(nombre?.length);
```

### Error de tipos
```dart
// ❌ Problemático
int numero = "123";  // Error: String no es int

// ✅ Solución
int numero = int.parse("123");  // Conversión explícita
```

## 💡 Consejos pedagógicos

### Para el profesor:

1. **Progresión gradual**:
   - Comenzar con variables simples
   - Introducir operadores paso a paso
   - Practicar null safety desde el inicio

2. **Ejemplos del mundo real**:
   - Calculadora de propinas
   - Conversor de unidades
   - Sistema de calificaciones

3. **Práctica interactiva**:
   - Usar DartPad para demostraciones
   - Ejercicios en vivo
   - Debugging conjunto

4. **Tiempo estimado**: 3-4 horas
   - Teoría: 1.5 horas
   - Práctica: 1.5 horas
   - Ejercicios: 1 hora

5. **Adaptaciones**:
   - **Principiantes**: Enfocarse en tipos básicos
   - **Intermedios**: Profundizar en null safety
   - **Avanzados**: Operadores especiales y buenas prácticas
