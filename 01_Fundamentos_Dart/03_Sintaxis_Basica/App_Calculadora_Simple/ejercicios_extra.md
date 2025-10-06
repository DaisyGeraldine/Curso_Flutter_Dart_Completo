# 🎯 Ejercicios Extra: Calculadora Simple

## 📚 Introducción

Estos ejercicios están diseñados para expandir tu calculadora básica y profundizar en conceptos más avanzados de Dart. Cada nivel incluye desafíos progresivos que te ayudarán a mejorar tus habilidades de programación.

**💡 Consejo**: Completa cada ejercicio antes de pasar al siguiente. Cada uno construye sobre el anterior.

---

## 🟢 Nivel 1: Básico (Fundamentos)

### 📝 Ejercicio 1.1: Calculadora de tres números
**Objetivo**: Extender la funcionalidad para manejar múltiples operandos

**Descripción**: Modifica tu calculadora para que pueda sumar, restar y multiplicar **tres números** en lugar de dos.

**Especificaciones**:
- Solicitar tres números al usuario
- Mostrar: `a + b + c`, `a - b - c`, `a × b × c`
- Para división: `a ÷ b ÷ c` (dividir a entre b, luego entre c)

**Ejemplo de salida**:
```
Ingrese tres números:
Número 1: 12
Número 2: 4
Número 3: 2

Resultados:
12 + 4 + 2 = 18
12 - 4 - 2 = 6
12 × 4 × 2 = 96
12 ÷ 4 ÷ 2 = 1.5
```

**Pistas**:
- Crea nuevas funciones: `sumarTres()`, `restarTres()`, etc.
- Considera el orden de las operaciones para resta y división

---

### 📝 Ejercicio 1.2: Detector de resultados negativos
**Objetivo**: Implementar validación condicional de resultados

**Descripción**: Añade lógica para detectar cuando el resultado de cualquier operación es negativo y mostrar un mensaje especial.

**Especificaciones**:
- Si el resultado es negativo, mostrar: `⚠️ Resultado negativo: [valor]`
- Si es positivo o cero, mostrar normalmente: `✅ Resultado: [valor]`
- Aplicar a todas las operaciones

**Ejemplo**:
```
5 - 8 = ⚠️ Resultado negativo: -3
8 + 2 = ✅ Resultado: 10
```

---

### 📝 Ejercicio 1.3: Selector de operación
**Objetivo**: Implementar control de flujo básico

**Descripción**: Permite al usuario elegir qué operación realizar en lugar de mostrar todas.

**Especificaciones**:
- Mostrar menú: `1-Suma, 2-Resta, 3-Multiplicación, 4-División`
- Realizar solo la operación seleccionada
- Validar entrada (1-4)

**Código de ejemplo**:
```dart
print('Seleccione operación:');
print('1. Suma');
print('2. Resta');
print('3. Multiplicación');
print('4. División');
```

---

## 🟡 Nivel 2: Intermedio (Funcionalidad)

### 📝 Ejercicio 2.1: Calculadora completa mejorada
**Objetivo**: Consolidar todas las operaciones básicas con validación

**Descripción**: Si no lo has hecho, implementa las cuatro operaciones básicas con validación completa.

**Especificaciones**:
- Suma, resta, multiplicación y división
- Validación de división por cero
- Manejo de errores con try-catch
- Mensajes de error informativos

**Ejemplo de validación**:
```dart
double? dividir(double a, double b) {
  if (b == 0) {
    print('❌ Error: No se puede dividir por cero');
    return null;
  }
  return a / b;
}
```

---

### 📝 Ejercicio 2.2: Calculadora con validación avanzada
**Objetivo**: Implementar manejo robusto de errores

**Descripción**: Añade validación para entrada de datos inválida (texto en lugar de números).

**Especificaciones**:
- Usar `try-catch` para capturar errores de parsing
- Permitir reintentar entrada inválida
- Mostrar mensajes de error específicos

**Implementación sugerida**:
```dart
double? leerNumeroSeguro(String mensaje) {
  while (true) {
    try {
      stdout.write(mensaje);
      String? entrada = stdin.readLineSync();
      return double.parse(entrada ?? '0');
    } catch (e) {
      print('❌ Entrada inválida. Ingrese un número válido.');
    }
  }
}
```

---

### 📝 Ejercicio 2.3: Calculadora con repetición
**Objetivo**: Implementar bucles y control de flujo

**Descripción**: Permite al usuario realizar múltiples operaciones sin reiniciar el programa.

**Especificaciones**:
- Después de cada cálculo, preguntar: `¿Continuar? (s/n)`
- Bucle principal que se repita hasta que el usuario diga "no"
- Limpiar pantalla entre operaciones (opcional)

**Estructura del bucle**:
```dart
void main() {
  bool continuar = true;
  
  while (continuar) {
    // Realizar cálculo
    continuar = preguntarContinuar();
  }
  
  print('¡Gracias por usar la calculadora!');
}
```

---

## 🟠 Nivel 3: Avanzado (Estructuras de datos)

### 📝 Ejercicio 3.1: Suma de lista de números
**Objetivo**: Trabajar con listas y funciones de orden superior

**Descripción**: Implementa una función que reciba una lista de números y devuelva su suma total.

**Especificaciones**:
- Función `sumarLista(List<double> numeros)`
- Permitir al usuario ingresar n números
- Mostrar la suma total y el promedio

**Implementación**:
```dart
double sumarLista(List<double> numeros) {
  return numeros.fold(0.0, (sum, num) => sum + num);
}

double promedioLista(List<double> numeros) {
  if (numeros.isEmpty) return 0;
  return sumarLista(numeros) / numeros.length;
}
```

**Ejemplo de uso**:
```
¿Cuántos números desea sumar? 4
Número 1: 10
Número 2: 20
Número 3: 15
Número 4: 5

Suma total: 50
Promedio: 12.5
```

---

### 📝 Ejercicio 3.2: Calculadora científica básica
**Objetivo**: Ampliar operaciones matemáticas

**Descripción**: Añade operaciones matemáticas avanzadas utilizando la librería `dart:math`.

**Operaciones a implementar**:
- Potencia (a^b)
- Raíz cuadrada
- Seno, coseno, tangente
- Logaritmo natural y base 10
- Valor absoluto

**Código de ejemplo**:
```dart
import 'dart:math';

double potencia(double base, double exponente) {
  return pow(base, exponente).toDouble();
}

double raizCuadrada(double numero) {
  if (numero < 0) {
    throw ArgumentError('No se puede calcular raíz de número negativo');
  }
  return sqrt(numero);
}
```

---

### 📝 Ejercicio 3.3: Historial de operaciones
**Objetivo**: Implementar almacenamiento temporal de datos

**Descripción**: Mantén un historial de todas las operaciones realizadas durante la sesión.

**Especificaciones**:
- Almacenar cada operación en una lista
- Mostrar historial al final o cuando el usuario lo solicite
- Opción para limpiar historial

**Estructura de datos**:
```dart
class Operacion {
  final double operando1;
  final double operando2;
  final String operador;
  final double resultado;
  final DateTime fecha;
  
  Operacion(this.operando1, this.operando2, this.operador, this.resultado) 
    : fecha = DateTime.now();
  
  @override
  String toString() {
    return '$operando1 $operador $operando2 = $resultado';
  }
}
```

---

## 🔴 Nivel 4: Experto (Funcionalidades avanzadas)

### 📝 Ejercicio 4.1: Sistema de deshacer (Undo)
**Objetivo**: Implementar patrones de diseño y gestión de estado

**Descripción**: Permite al usuario deshacer la última operación realizada.

**Especificaciones**:
- Usar stack (pila) para almacenar estados
- Comando "deshacer" que revierte el último cálculo
- Máximo 10 operaciones en el historial de deshacer

**Implementación con Stack**:
```dart
class CalculadoraConUndo {
  final List<Operacion> _historial = [];
  final List<Operacion> _pilaDeshacer = [];
  
  void ejecutarOperacion(Operacion op) {
    _pilaDeshacer.add(op);
    if (_pilaDeshacer.length > 10) {
      _pilaDeshacer.removeAt(0);
    }
    _historial.add(op);
  }
  
  bool deshacer() {
    if (_pilaDeshacer.isEmpty) return false;
    
    Operacion ultima = _pilaDeshacer.removeLast();
    _historial.remove(ultima);
    print('Operación deshecha: $ultima');
    return true;
  }
}
```

---

### 📝 Ejercicio 4.2: Interfaz de menú avanzada
**Objetivo**: Crear una experiencia de usuario completa

**Descripción**: Implementa una interfaz de consola completa con múltiples opciones.

**Opciones del menú**:
1. Operaciones básicas
2. Operaciones científicas
3. Trabajar con listas
4. Ver historial
5. Limpiar historial
6. Deshacer última operación
7. Configuración
8. Ayuda
9. Salir

**Ejemplo de interfaz**:
```
╔════════════════════════════════╗
║        CALCULADORA PRO         ║
║                                ║
║  1. Operaciones básicas        ║
║  2. Operaciones científicas    ║
║  3. Trabajar con listas        ║
║  4. Ver historial             ║
║  5. Limpiar historial         ║
║  6. Deshacer                  ║
║  7. Configuración             ║
║  8. Ayuda                     ║
║  9. Salir                     ║
║                                ║
╚════════════════════════════════╝

Seleccione una opción (1-9): 
```

---

### 📝 Ejercicio 4.3: Calculadora con configuraciones
**Objetivo**: Implementar personalización y persistencia

**Descripción**: Añade opciones de configuración que persistan entre sesiones.

**Configuraciones**:
- Precisión decimal (número de decimales a mostrar)
- Formato de salida (científico, normal)
- Idioma de los mensajes
- Tema de colores (si usas códigos ANSI)

**Almacenamiento en archivo**:
```dart
import 'dart:io';
import 'dart:convert';

class Configuracion {
  int precision = 2;
  String formato = 'normal';
  String idioma = 'es';
  
  Map<String, dynamic> toJson() => {
    'precision': precision,
    'formato': formato,
    'idioma': idioma,
  };
  
  void fromJson(Map<String, dynamic> json) {
    precision = json['precision'] ?? 2;
    formato = json['formato'] ?? 'normal';
    idioma = json['idioma'] ?? 'es';
  }
  
  void guardar() async {
    final file = File('config.json');
    await file.writeAsString(jsonEncode(toJson()));
  }
  
  void cargar() async {
    try {
      final file = File('config.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        fromJson(jsonDecode(contents));
      }
    } catch (e) {
      print('No se pudo cargar configuración: $e');
    }
  }
}
```

---

## 🏆 Proyecto Final: Calculadora Completa

### 📝 Desafío Ultimate: Sistema completo
**Objetivo**: Integrar todas las funcionalidades en una aplicación profesional

**Características requeridas**:
- ✅ Todas las operaciones básicas y científicas
- ✅ Manejo robusto de errores
- ✅ Interfaz de usuario intuitiva
- ✅ Historial con deshacer/rehacer
- ✅ Configuraciones personalizables
- ✅ Ayuda integrada
- ✅ Código bien documentado
- ✅ Arquitectura modular

**Estructura de archivos sugerida**:
```
calculadora_pro/
├── lib/
│   ├── calculadora.dart      # Lógica principal
│   ├── operaciones.dart      # Operaciones matemáticas
│   ├── interfaz.dart         # UI de consola
│   ├── historial.dart        # Gestión de historial
│   ├── configuracion.dart    # Settings
│   └── utilidades.dart       # Funciones auxiliares
├── bin/
│   └── main.dart            # Punto de entrada
├── test/
│   └── calculadora_test.dart # Tests unitarios
└── README.md               # Documentación
```

---

## 📊 Sistema de Puntuación

| Nivel | Ejercicios | Puntos Base | Bonus | Total Posible |
|-------|------------|-------------|-------|--------------|
| Básico | 1.1 - 1.3 | 15 pts | 5 pts | 20 pts |
| Intermedio | 2.1 - 2.3 | 25 pts | 10 pts | 35 pts |
| Avanzado | 3.1 - 3.3 | 30 pts | 15 pts | 45 pts |
| Experto | 4.1 - 4.3 | 40 pts | 20 pts | 60 pts |
| **Proyecto Final** | Ultimate | 50 pts | 30 pts | 80 pts |
| **TOTAL** | - | **160 pts** | **80 pts** | **240 pts** |

---

## 🎯 Criterios de Evaluación Detallados

### Funcionalidad (40%)
- **Excelente (36-40)**: Todas las funcionalidades implementadas sin errores
- **Bueno (28-35)**: Funcionalidades principales + algunas avanzadas
- **Satisfactorio (20-27)**: Funcionalidades básicas completas
- **Insuficiente (<20)**: Funcionalidades incompletas o con errores

### Calidad del Código (30%)
- **Excelente (27-30)**: Código limpio, bien estructurado, documentado
- **Bueno (21-26)**: Código organizado con documentación básica
- **Satisfactorio (15-20)**: Código funcional pero desorganizado
- **Insuficiente (<15)**: Código difícil de entender o mantener

### Innovación (20%)
- **Excelente (18-20)**: Características creativas más allá de los requisitos
- **Bueno (14-17)**: Algunas mejoras o características adicionales
- **Satisfactorio (10-13)**: Cumple exactamente con los requisitos
- **Insuficiente (<10)**: No cumple con los requisitos mínimos

### Testing (10%)
- **Excelente (9-10)**: Tests comprehensivos para todas las funciones
- **Bueno (7-8)**: Tests básicos para funciones principales
- **Satisfactorio (5-6)**: Algunos tests o pruebas manuales documentadas
- **Insuficiente (<5)**: Sin evidencia de testing

---

## 💡 Tips para el Éxito

### 🚀 Para Principiantes
1. **Empieza pequeño**: No intentes hacer todo a la vez
2. **Prueba frecuentemente**: Ejecuta tu código después de cada cambio pequeño
3. **Lee los errores**: Los mensajes de error son tus amigos
4. **Usa DartPad**: Para probar fragmentos de código rápidamente

### 🎯 Para Nivel Intermedio
1. **Planifica la arquitectura**: Piensa en cómo organizar tu código
2. **Maneja errores apropiadamente**: No ignores los casos edge
3. **Escribe funciones pequeñas**: Una función, una responsabilidad
4. **Documenta tu código**: Tu yo futuro te lo agradecerá

### 🏆 Para Nivel Avanzado
1. **Aplica patrones de diseño**: Strategy, Command, Observer
2. **Considera la performance**: ¿Tu código es eficiente?
3. **Piensa en testing**: Escribe código testeable
4. **Mantén SOLID principles**: Especialmente Single Responsibility

---

## 📚 Recursos Adicionales

### 📖 Documentación
- [Dart Official Documentation](https://dart.dev/guides)
- [Effective Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- [Dart Math Library](https://api.dart.dev/stable/dart-math/dart-math-library.html)

### 🎥 Video Tutoriales
- [Dart Programming Tutorial](https://www.youtube.com/playlist?list=PLjxrf2q8roU0Net_g1NT5_vOO3s_FR02J)
- [Flutter & Dart Bootcamp](https://www.udemy.com/course/flutter-bootcamp-with-dart/)

### 🛠️ Herramientas
- [DartPad](https://dartpad.dev) - Editor online
- [VS Code Dart Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- [IntelliJ IDEA Dart Plugin](https://plugins.jetbrains.com/plugin/6351-dart)

---

## 🎖️ Certificado de Finalización

Al completar exitosamente el **Proyecto Final** con una puntuación mínima de **180/240 puntos**, habrás demostrado:

✅ Dominio de la sintaxis básica de Dart  
✅ Capacidad de crear aplicaciones funcionales  
✅ Habilidades de resolución de problemas  
✅ Conocimiento de buenas prácticas de programación  
✅ Experiencia con testing y validación  

**¡Felicidades! Estás listo para el siguiente nivel de Dart y Flutter! 🚀**

---

*¿Preguntas? ¿Necesitas ayuda? No dudes en consultar con tu instructor o usar los recursos de la comunidad Dart.*
