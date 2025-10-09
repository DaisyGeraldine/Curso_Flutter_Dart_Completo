# 📋 Solucionario: Funciones y Manejo de Errores en Dart

## 🎯 Ejercicios Básicos del Contenido Teórico

### ✅ **Ejercicio 1**: Calculadora de formas geométricas
**Enunciado**: Crear funciones para calcular áreas de diferentes formas con validación de parámetros.

#### 💡 **Solución Completa**:
```dart
import 'dart:math';

// Excepción personalizada para valores inválidos
class ParametroInvalidoException implements Exception {
  final String mensaje;
  final double valorIngresado;
  
  ParametroInvalidoException(this.mensaje, this.valorIngresado);
  
  @override
  String toString() => 'ParametroInvalidoException: $mensaje (Valor: $valorIngresado)';
}

// Función para calcular área de círculo
double areaCirculo(double radio) {
  if (radio < 0) {
    throw ParametroInvalidoException('El radio no puede ser negativo', radio);
  }
  if (radio == 0) {
    return 0.0; // Caso especial válido
  }
  
  return pi * radio * radio;
}

// Función para calcular área de rectángulo
double areaRectangulo(double largo, double ancho) {
  if (largo < 0) {
    throw ParametroInvalidoException('El largo no puede ser negativo', largo);
  }
  if (ancho < 0) {
    throw ParametroInvalidoException('El ancho no puede ser negativo', ancho);
  }
  
  return largo * ancho;
}

// Función para calcular área de triángulo
double areaTriangulo(double base, double altura) {
  if (base < 0) {
    throw ParametroInvalidoException('La base no puede ser negativa', base);
  }
  if (altura < 0) {
    throw ParametroInvalidoException('La altura no puede ser negativa', altura);
  }
  
  return (base * altura) / 2;
}

// Función principal con menú interactivo
void main() {
  print("=== CALCULADORA DE FORMAS GEOMÉTRICAS ===\n");
  
  // Probar área de círculo
  print("📐 CÍRCULOS:");
  calcularYMostrarArea("Círculo (r=5)", () => areaCirculo(5));
  calcularYMostrarArea("Círculo (r=0)", () => areaCirculo(0));
  calcularYMostrarArea("Círculo (r=-3)", () => areaCirculo(-3));
  
  print("\n📐 RECTÁNGULOS:");
  calcularYMostrarArea("Rectángulo (10x5)", () => areaRectangulo(10, 5));
  calcularYMostrarArea("Rectángulo (0x5)", () => areaRectangulo(0, 5));
  calcularYMostrarArea("Rectángulo (-2x5)", () => areaRectangulo(-2, 5));
  
  print("\n📐 TRIÁNGULOS:");
  calcularYMostrarArea("Triángulo (b=6, h=4)", () => areaTriangulo(6, 4));
  calcularYMostrarArea("Triángulo (b=10, h=0)", () => areaTriangulo(10, 0));
  calcularYMostrarArea("Triángulo (b=-5, h=3)", () => areaTriangulo(-5, 3));
}

// Función auxiliar para calcular y mostrar resultados
void calcularYMostrarArea(String descripcion, double Function() calcular) {
  try {
    double area = calcular();
    print("✅ $descripcion: ${area.toStringAsFixed(2)} unidades²");
  } catch (e) {
    print("❌ $descripcion: $e");
  }
}
```

#### 🔄 **Variante con función genérica**:
```dart
// Resultado encapsulado para mayor seguridad
class ResultadoCalculo {
  final double? area;
  final bool exitoso;
  final String? error;
  
  ResultadoCalculo.exitoso(this.area) : exitoso = true, error = null;
  ResultadoCalculo.error(this.error) : area = null, exitoso = false;
  
  @override
  String toString() {
    return exitoso 
        ? "Área: ${area!.toStringAsFixed(2)} unidades²"
        : "Error: $error";
  }
}

class CalculadoraFormas {
  static ResultadoCalculo circulo(double radio) {
    try {
      if (radio < 0) {
        return ResultadoCalculo.error("Radio no puede ser negativo");
      }
      return ResultadoCalculo.exitoso(pi * radio * radio);
    } catch (e) {
      return ResultadoCalculo.error("Error inesperado: $e");
    }
  }
  
  static ResultadoCalculo rectangulo(double largo, double ancho) {
    try {
      if (largo < 0 || ancho < 0) {
        return ResultadoCalculo.error("Las dimensiones no pueden ser negativas");
      }
      return ResultadoCalculo.exitoso(largo * ancho);
    } catch (e) {
      return ResultadoCalculo.error("Error inesperado: $e");
    }
  }
}
```

#### 🧪 **Casos de prueba**:
- **Radio 5**: → Area = 78.54 unidades²
- **Radio 0**: → Area = 0.00 unidades²  
- **Radio -3**: → Error: ParametroInvalidoException
- **Rectángulo 10x5**: → Area = 50.00 unidades²
- **Triángulo base=6, altura=4**: → Area = 12.00 unidades²

---

### ✅ **Ejercicio 2**: Conversor de temperaturas
**Enunciado**: Implementar funciones de conversión con validación de temperaturas físicamente imposibles.

#### 💡 **Solución Completa**:
```dart
// Constantes físicas
class ConstantesFisicas {
  static const double ceroAbsolutoKelvin = 0.0;
  static const double ceroAbsolutoCelsius = -273.15;
  static const double ceroAbsolutoFahrenheit = -459.67;
}

// Excepción para temperaturas inválidas
class TemperaturaInvalidaException implements Exception {
  final String mensaje;
  final double temperatura;
  final String escala;
  
  TemperaturaInvalidaException(this.mensaje, this.temperatura, this.escala);
  
  @override
  String toString() => 'TemperaturaInvalidaException: $mensaje ($temperatura° $escala)';
}

// Conversor de temperaturas con validaciones
class ConversorTemperatura {
  
  // Celsius a Fahrenheit
  static double celsiusAFahrenheit(double celsius) {
    _validarCelsius(celsius);
    return (celsius * 9/5) + 32;
  }
  
  // Fahrenheit a Celsius
  static double fahrenheitACelsius(double fahrenheit) {
    _validarFahrenheit(fahrenheit);
    return (fahrenheit - 32) * 5/9;
  }
  
  // Celsius a Kelvin
  static double celsiusAKelvin(double celsius) {
    _validarCelsius(celsius);
    return celsius + 273.15;
  }
  
  // Kelvin a Celsius
  static double kelvinACelsius(double kelvin) {
    _validarKelvin(kelvin);
    return kelvin - 273.15;
  }
  
  // Fahrenheit a Kelvin
  static double fahrenheitAKelvin(double fahrenheit) {
    double celsius = fahrenheitACelsius(fahrenheit);
    return celsiusAKelvin(celsius);
  }
  
  // Kelvin a Fahrenheit
  static double kelvinAFahrenheit(double kelvin) {
    double celsius = kelvinACelsius(kelvin);
    return celsiusAFahrenheit(celsius);
  }
  
  // Validaciones privadas
  static void _validarCelsius(double celsius) {
    if (celsius < ConstantesFisicas.ceroAbsolutoCelsius) {
      throw TemperaturaInvalidaException(
        'Temperatura por debajo del cero absoluto', 
        celsius, 
        'C'
      );
    }
  }
  
  static void _validarFahrenheit(double fahrenheit) {
    if (fahrenheit < ConstantesFisicas.ceroAbsolutoFahrenheit) {
      throw TemperaturaInvalidaException(
        'Temperatura por debajo del cero absoluto', 
        fahrenheit, 
        'F'
      );
    }
  }
  
  static void _validarKelvin(double kelvin) {
    if (kelvin < ConstantesFisicas.ceroAbsolutoKelvin) {
      throw TemperaturaInvalidaException(
        'Temperatura por debajo del cero absoluto', 
        kelvin, 
        'K'
      );
    }
  }
  
  // Función de conveniencia para conversiones seguras
  static String convertirSeguro(
    double temperatura, 
    String escalaOrigen, 
    String escalaDestino
  ) {
    try {
      double resultado;
      String simboloOrigen = _obtenerSimbolo(escalaOrigen);
      String simboloDestino = _obtenerSimbolo(escalaDestino);
      
      // Determinar la conversión apropiada
      if (escalaOrigen == 'celsius' && escalaDestino == 'fahrenheit') {
        resultado = celsiusAFahrenheit(temperatura);
      } else if (escalaOrigen == 'fahrenheit' && escalaDestino == 'celsius') {
        resultado = fahrenheitACelsius(temperatura);
      } else if (escalaOrigen == 'celsius' && escalaDestino == 'kelvin') {
        resultado = celsiusAKelvin(temperatura);
      } else if (escalaOrigen == 'kelvin' && escalaDestino == 'celsius') {
        resultado = kelvinACelsius(temperatura);
      } else if (escalaOrigen == 'fahrenheit' && escalaDestino == 'kelvin') {
        resultado = fahrenheitAKelvin(temperatura);
      } else if (escalaOrigen == 'kelvin' && escalaDestino == 'fahrenheit') {
        resultado = kelvinAFahrenheit(temperatura);
      } else {
        return "❌ Conversión no soportada: $escalaOrigen → $escalaDestino";
      }
      
      return "✅ $temperatura°$simboloOrigen = ${resultado.toStringAsFixed(2)}°$simboloDestino";
      
    } catch (e) {
      return "❌ Error: $e";
    }
  }
  
  static String _obtenerSimbolo(String escala) {
    switch (escala.toLowerCase()) {
      case 'celsius': return 'C';
      case 'fahrenheit': return 'F';
      case 'kelvin': return 'K';
      default: return escala.toUpperCase();
    }
  }
}

void main() {
  print("🌡️ CONVERSOR DE TEMPERATURAS\n");
  
  // Casos de prueba normales
  print("📊 CONVERSIONES NORMALES:");
  print(ConversorTemperatura.convertirSeguro(0, 'celsius', 'fahrenheit'));
  print(ConversorTemperatura.convertirSeguro(32, 'fahrenheit', 'celsius'));
  print(ConversorTemperatura.convertirSeguro(100, 'celsius', 'kelvin'));
  print(ConversorTemperatura.convertirSeguro(273.15, 'kelvin', 'celsius'));
  
  // Casos extremos válidos
  print("\n🧊 TEMPERATURAS EXTREMAS VÁLIDAS:");
  print(ConversorTemperatura.convertirSeguro(-273.15, 'celsius', 'kelvin'));
  print(ConversorTemperatura.convertirSeguro(0, 'kelvin', 'celsius'));
  
  // Casos inválidos (bajo cero absoluto)
  print("\n❄️ TEMPERATURAS INVÁLIDAS:");
  print(ConversorTemperatura.convertirSeguro(-300, 'celsius', 'fahrenheit'));
  print(ConversorTemperatura.convertirSeguro(-500, 'fahrenheit', 'celsius'));
  print(ConversorTemperatura.convertirSeguro(-10, 'kelvin', 'celsius'));
}
```

---

### ✅ **Ejercicio 3**: Sistema de validación de datos
**Enunciado**: Crear funciones de validación con excepciones personalizadas para diferentes tipos de datos.

#### 💡 **Solución Completa**:
```dart
import 'dart:io';

// Excepciones personalizadas para validación
class TelefonoInvalidoException implements Exception {
  final String telefono;
  final String razon;
  
  TelefonoInvalidoException(this.telefono, this.razon);
  
  @override
  String toString() => 'TelefonoInvalidoException: $razon ("$telefono")';
}

class EmailInvalidoException implements Exception {
  final String email;
  
  EmailInvalidoException(this.email);
  
  @override
  String toString() => 'EmailInvalidoException: Formato de email inválido ("$email")';
}

class PasswordInvalidoException implements Exception {
  final String razon;
  final List<String> requisitos;
  
  PasswordInvalidoException(this.razon, this.requisitos);
  
  @override
  String toString() {
    String req = requisitos.join(', ');
    return 'PasswordInvalidoException: $razon. Requisitos: $req';
  }
}

// Sistema de validación
class ValidadorDatos {
  
  // Validar número de teléfono
  static bool validarTelefono(String telefono) {
    String telefonoLimpio = telefono.replaceAll(RegExp(r'[^\d]'), '');
    
    if (telefonoLimpio.isEmpty) {
      throw TelefonoInvalidoException(telefono, 'No contiene dígitos');
    }
    
    if (telefonoLimpio.length < 7) {
      throw TelefonoInvalidoException(telefono, 'Muy corto (mínimo 7 dígitos)');
    }
    
    if (telefonoLimpio.length > 15) {
      throw TelefonoInvalidoException(telefono, 'Muy largo (máximo 15 dígitos)');
    }
    
    // Validar que no sea todo el mismo dígito
    if (RegExp(r'^(\d)\1+$').hasMatch(telefonoLimpio)) {
      throw TelefonoInvalidoException(telefono, 'No puede ser todo el mismo dígito');
    }
    
    return true;
  }
  
  // Validar email
  static bool validarEmail(String email) {
    // Expresión regular para email básica
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );
    
    if (!emailRegex.hasMatch(email)) {
      throw EmailInvalidoException(email);
    }
    
    // Validaciones adicionales
    if (email.length > 254) {
      throw EmailInvalidoException(email);
    }
    
    // No debe empezar o terminar con punto
    if (email.startsWith('.') || email.endsWith('.')) {
      throw EmailInvalidoException(email);
    }
    
    return true;
  }
  
  // Validar contraseña
  static bool validarPassword(String password, {
    int longitudMinima = 8,
    bool requiereMayuscula = true,
    bool requiereMinuscula = true,
    bool requiereNumero = true,
    bool requiereEspecial = true,
  }) {
    List<String> errores = [];
    List<String> requisitos = [];
    
    // Verificar longitud
    if (password.length < longitudMinima) {
      errores.add('Muy corta');
      requisitos.add('mínimo $longitudMinima caracteres');
    }
    
    // Verificar mayúscula
    if (requiereMayuscula && !RegExp(r'[A-Z]').hasMatch(password)) {
      errores.add('Sin mayúsculas');
      requisitos.add('al menos una mayúscula');
    }
    
    // Verificar minúscula
    if (requiereMinuscula && !RegExp(r'[a-z]').hasMatch(password)) {
      errores.add('Sin minúsculas');
      requisitos.add('al menos una minúscula');
    }
    
    // Verificar número
    if (requiereNumero && !RegExp(r'[0-9]').hasMatch(password)) {
      errores.add('Sin números');
      requisitos.add('al menos un número');
    }
    
    // Verificar carácter especial
    if (requiereEspecial && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      errores.add('Sin caracteres especiales');
      requisitos.add('al menos un carácter especial (!@#$%^&*(),.?":{}|<>)');
    }
    
    if (errores.isNotEmpty) {
      throw PasswordInvalidoException(errores.join(', '), requisitos);
    }
    
    return true;
  }
  
  // Función integral de validación
  static Map<String, bool> validarUsuario({
    required String nombre,
    required String email,
    required String telefono,
    required String password,
  }) {
    Map<String, bool> resultados = {
      'nombre': false,
      'email': false,
      'telefono': false,
      'password': false,
    };
    
    // Validar nombre
    try {
      if (nombre.trim().isEmpty) {
        throw ArgumentError('El nombre no puede estar vacío');
      }
      if (nombre.trim().length < 2) {
        throw ArgumentError('El nombre debe tener al menos 2 caracteres');
      }
      resultados['nombre'] = true;
      print('✅ Nombre válido: "$nombre"');
    } catch (e) {
      print('❌ Nombre inválido: $e');
    }
    
    // Validar email
    try {
      validarEmail(email);
      resultados['email'] = true;
      print('✅ Email válido: "$email"');
    } catch (e) {
      print('❌ Email inválido: $e');
    }
    
    // Validar teléfono
    try {
      validarTelefono(telefono);
      resultados['telefono'] = true;
      print('✅ Teléfono válido: "$telefono"');
    } catch (e) {
      print('❌ Teléfono inválido: $e');
    }
    
    // Validar password
    try {
      validarPassword(password);
      resultados['password'] = true;
      print('✅ Contraseña válida');
    } catch (e) {
      print('❌ Contraseña inválida: $e');
    }
    
    return resultados;
  }
}

void main() {
  print('🔐 SISTEMA DE VALIDACIÓN DE DATOS\n');
  
  // Casos de prueba
  List<Map<String, String>> usuarios = [
    {
      'nombre': 'Ana García',
      'email': 'ana.garcia@email.com',
      'telefono': '+1-555-123-4567',
      'password': 'MiPassword123!',
    },
    {
      'nombre': '',
      'email': 'email.invalido',
      'telefono': '123',
      'password': '123',
    },
    {
      'nombre': 'Carlos López',
      'email': 'carlos@empresa.co',
      'telefono': '5551234567',
      'password': 'ContraseñaSegura2024#',
    },
    {
      'nombre': 'X',
      'email': 'test@.com',
      'telefono': '1111111111',
      'password': 'noMayusculas123!',
    }
  ];
  
  for (int i = 0; i < usuarios.length; i++) {
    print('👤 USUARIO ${i + 1}:');
    Map<String, String> usuario = usuarios[i];
    
    Map<String, bool> resultados = ValidadorDatos.validarUsuario(
      nombre: usuario['nombre']!,
      email: usuario['email']!,
      telefono: usuario['telefono']!,
      password: usuario['password']!,
    );
    
    bool todoValido = resultados.values.every((valido) => valido);
    print('${todoValido ? "🎉" : "⚠️"} Registro ${todoValido ? "EXITOSO" : "FALLÓ"}\n');
  }
}
```

---

## 🟡 Ejercicios Intermedios

### ✅ **Ejercicio 4**: Sistema de calificaciones
**Enunciado**: Sistema completo de manejo de calificaciones con estadísticas y configuración flexible.

#### 💡 **Solución Completa**:
```dart
// Excepción personalizada para calificaciones
class CalificacionInvalidaException implements Exception {
  final double calificacion;
  final double min;
  final double max;
  
  CalificacionInvalidaException(this.calificacion, this.min, this.max);
  
  @override
  String toString() => 'CalificacionInvalidaException: $calificacion fuera del rango [$min, $max]';
}

// Clase para representar una calificación
class Calificacion {
  final String materia;
  final double nota;
  final double peso;
  final DateTime fecha;
  
  Calificacion({
    required this.materia,
    required this.nota,
    this.peso = 1.0,
    DateTime? fecha,
  }) : fecha = fecha ?? DateTime.now();
  
  @override
  String toString() => '$materia: $nota (peso: $peso)';
}

// Sistema de calificaciones
class SistemaCalificaciones {
  final double notaMinima;
  final double notaMaxima;
  final Map<String, String> escalasLetras;
  
  SistemaCalificaciones({
    this.notaMinima = 0.0,
    this.notaMaxima = 100.0,
  }) : escalasLetras = {
    'A': '90-100: Excelente',
    'B': '80-89: Muy Bueno', 
    'C': '70-79: Bueno',
    'D': '60-69: Suficiente',
    'F': '0-59: Insuficiente'
  };
  
  // Validar una calificación individual
  void validarNota(double nota) {
    if (nota < notaMinima || nota > notaMaxima) {
      throw CalificacionInvalidaException(nota, notaMinima, notaMaxima);
    }
  }
  
  // Calcular promedio simple
  double calcularPromedioSimple(List<double> notas) {
    if (notas.isEmpty) {
      throw ArgumentError('La lista de notas no puede estar vacía');
    }
    
    for (double nota in notas) {
      validarNota(nota);
    }
    
    double suma = notas.reduce((a, b) => a + b);
    return suma / notas.length;
  }
  
  // Calcular promedio ponderado
  double calcularPromedioPonderado(List<Calificacion> calificaciones) {
    if (calificaciones.isEmpty) {
      throw ArgumentError('La lista de calificaciones no puede estar vacía');
    }
    
    double sumaNotasPonderadas = 0;
    double sumaPesos = 0;
    
    for (Calificacion cal in calificaciones) {
      validarNota(cal.nota);
      sumaNotasPonderadas += cal.nota * cal.peso;
      sumaPesos += cal.peso;
    }
    
    if (sumaPesos == 0) {
      throw ArgumentError('La suma de pesos no puede ser cero');
    }
    
    return sumaNotasPonderadas / sumaPesos;
  }
  
  // Obtener letra de calificación
  String obtenerLetraCalificacion(double promedio) {
    validarNota(promedio);
    
    if (promedio >= 90) return 'A';
    if (promedio >= 80) return 'B';
    if (promedio >= 70) return 'C';
    if (promedio >= 60) return 'D';
    return 'F';
  }
  
  // Generar reporte completo
  Map<String, dynamic> generarReporte(
    String nombreEstudiante,
    List<Calificacion> calificaciones, {
    bool incluirDetalle = true,
    bool incluirEstadisticas = true,
  }) {
    try {
      double promedio = calcularPromedioPonderado(calificaciones);
      String letra = obtenerLetraCalificacion(promedio);
      
      Map<String, dynamic> reporte = {
        'estudiante': nombreEstudiante,
        'promedio': double.parse(promedio.toStringAsFixed(2)),
        'letra': letra,
        'descripcion': escalasLetras[letra],
        'aprobado': promedio >= 60,
        'fecha_reporte': DateTime.now().toString(),
      };
      
      if (incluirDetalle) {
        reporte['calificaciones'] = calificaciones.map((c) => {
          'materia': c.materia,
          'nota': c.nota,
          'peso': c.peso,
          'fecha': c.fecha.toString().split(' ')[0], // Solo fecha
        }).toList();
      }
      
      if (incluirEstadisticas) {
        List<double> notas = calificaciones.map((c) => c.nota).toList();
        notas.sort();
        
        reporte['estadisticas'] = {
          'nota_maxima': notas.last,
          'nota_minima': notas.first,
          'mediana': _calcularMediana(notas),
          'total_materias': calificaciones.length,
          'materias_aprobadas': calificaciones.where((c) => c.nota >= 60).length,
        };
      }
      
      return reporte;
    } catch (e) {
      return {
        'error': true,
        'mensaje': e.toString(),
        'estudiante': nombreEstudiante,
      };
    }
  }
  
  // Calcular mediana
  double _calcularMediana(List<double> notas) {
    int n = notas.length;
    if (n % 2 == 1) {
      return notas[n ~/ 2];
    } else {
      return (notas[n ~/ 2 - 1] + notas[n ~/ 2]) / 2;
    }
  }
  
  // Mostrar reporte formateado
  void mostrarReporte(Map<String, dynamic> reporte) {
    if (reporte['error'] == true) {
      print('❌ Error en reporte: ${reporte['mensaje']}');
      return;
    }
    
    print('📊 REPORTE DE CALIFICACIONES');
    print('=' * 50);
    print('👤 Estudiante: ${reporte['estudiante']}');
    print('📈 Promedio: ${reporte['promedio']}');
    print('🎯 Calificación: ${reporte['letra']} - ${reporte['descripcion']}');
    print('✅ Estado: ${reporte['aprobado'] ? "APROBADO" : "REPROBADO"}');
    
    if (reporte.containsKey('estadisticas')) {
      Map<String, dynamic> stats = reporte['estadisticas'];
      print('\n📊 ESTADÍSTICAS:');
      print('   Nota máxima: ${stats['nota_maxima']}');
      print('   Nota mínima: ${stats['nota_minima']}');
      print('   Mediana: ${stats['mediana']}');
      print('   Total materias: ${stats['total_materias']}');
      print('   Materias aprobadas: ${stats['materias_aprobadas']}');
    }
    
    if (reporte.containsKey('calificaciones')) {
      print('\n📚 DETALLE POR MATERIA:');
      List<dynamic> califs = reporte['calificaciones'];
      for (var cal in califs) {
        String estado = cal['nota'] >= 60 ? '✅' : '❌';
        print('   $estado ${cal['materia']}: ${cal['nota']} (peso: ${cal['peso']})');
      }
    }
    
    print('📅 Fecha: ${reporte['fecha_reporte'].split(' ')[0]}');
    print('');
  }
}

void main() {
  print('🎓 SISTEMA DE CALIFICACIONES\n');
  
  SistemaCalificaciones sistema = SistemaCalificaciones();
  
  // Crear calificaciones de prueba
  List<Calificacion> calificacionesAna = [
    Calificacion(materia: 'Matemáticas', nota: 95, peso: 1.5),
    Calificacion(materia: 'Física', nota: 88, peso: 1.2),
    Calificacion(materia: 'Química', nota: 92, peso: 1.0),
    Calificacion(materia: 'Historia', nota: 85, peso: 0.8),
    Calificacion(materia: 'Literatura', nota: 90, peso: 1.0),
  ];
  
  List<Calificacion> calificacionesCarlos = [
    Calificacion(materia: 'Matemáticas', nota: 75, peso: 1.5),
    Calificacion(materia: 'Física', nota: 65, peso: 1.2),
    Calificacion(materia: 'Química', nota: 58, peso: 1.0),
    Calificacion(materia: 'Historia', nota: 82, peso: 0.8),
  ];
  
  // Caso con calificación inválida
  List<Calificacion> calificacionesInvalidas = [
    Calificacion(materia: 'Test', nota: 150, peso: 1.0), // Nota inválida
  ];
  
  // Generar reportes
  Map<String, dynamic> reporteAna = sistema.generarReporte('Ana García', calificacionesAna);
  sistema.mostrarReporte(reporteAna);
  
  Map<String, dynamic> reporteCarlos = sistema.generarReporte(
    'Carlos López', 
    calificacionesCarlos,
    incluirDetalle: true,
    incluirEstadisticas: true
  );
  sistema.mostrarReporte(reporteCarlos);
  
  Map<String, dynamic> reporteError = sistema.generarReporte('Error Test', calificacionesInvalidas);
  sistema.mostrarReporte(reporteError);
}
```

---

### ✅ **Ejercicio 5**: Calculadora científica
**Enunciado**: Implementar operaciones matemáticas avanzadas con manejo robusto de errores.

#### 💡 **Solución Completa**:
```dart
import 'dart:math';

// Excepciones específicas para operaciones matemáticas
class OperacionMatematicaException implements Exception {
  final String operacion;
  final String razon;
  final List<double> parametros;
  
  OperacionMatematicaException(this.operacion, this.razon, this.parametros);
  
  @override
  String toString() => 'OperacionMatematicaException en $operacion: $razon (parámetros: $parametros)';
}

// Resultado encapsulado para operaciones matemáticas
class ResultadoMatematico {
  final double? valor;
  final bool exitoso;
  final String? error;
  final String operacion;
  
  ResultadoMatematico.exitoso(this.valor, this.operacion) : 
    exitoso = true, error = null;
  
  ResultadoMatematico.error(this.error, this.operacion) : 
    valor = null, exitoso = false;
  
  @override
  String toString() {
    if (exitoso) {
      return '$operacion = ${valor!.toStringAsFixed(6)}';
    } else {
      return 'Error en $operacion: $error';
    }
  }
}

// Calculadora científica
class CalculadoraCientifica {
  
  // Operaciones básicas seguras
  static ResultadoMatematico sumar(double a, double b) {
    try {
      double resultado = a + b;
      if (resultado.isInfinite) {
        return ResultadoMatematico.error('Resultado infinito', 'suma');
      }
      return ResultadoMatematico.exitoso(resultado, '$a + $b');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'suma');
    }
  }
  
  static ResultadoMatematico dividir(double dividendo, double divisor) {
    try {
      if (divisor == 0) {
        return ResultadoMatematico.error('División por cero', 'división');
      }
      
      double resultado = dividendo / divisor;
      
      if (resultado.isInfinite) {
        return ResultadoMatematico.error('Resultado infinito', 'división');
      }
      if (resultado.isNaN) {
        return ResultadoMatematico.error('Resultado no es número', 'división');
      }
      
      return ResultadoMatematico.exitoso(resultado, '$dividendo ÷ $divisor');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'división');
    }
  }
  
  // Operaciones de potenciación
  static ResultadoMatematico potencia(double base, double exponente) {
    try {
      // Casos especiales
      if (base == 0 && exponente < 0) {
        return ResultadoMatematico.error('0 elevado a exponente negativo', 'potenciación');
      }
      
      if (base < 0 && exponente != exponente.roundToDouble()) {
        return ResultadoMatematico.error('Base negativa con exponente decimal', 'potenciación');
      }
      
      double resultado = pow(base, exponente).toDouble();
      
      if (resultado.isInfinite) {
        return ResultadoMatematico.error('Resultado infinito', 'potenciación');
      }
      if (resultado.isNaN) {
        return ResultadoMatematico.error('Resultado no válido', 'potenciación');
      }
      
      return ResultadoMatematico.exitoso(resultado, '$base ^ $exponente');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'potenciación');
    }
  }
  
  static ResultadoMatematico raizCuadrada(double numero) {
    try {
      if (numero < 0) {
        return ResultadoMatematico.error('Raíz de número negativo', 'raíz cuadrada');
      }
      
      double resultado = sqrt(numero);
      return ResultadoMatematico.exitoso(resultado, '√$numero');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'raíz cuadrada');
    }
  }
  
  static ResultadoMatematico raizN(double numero, double n) {
    try {
      if (n == 0) {
        return ResultadoMatematico.error('Índice de raíz no puede ser cero', 'raíz n-ésima');
      }
      
      if (numero < 0 && n % 2 == 0) {
        return ResultadoMatematico.error('Raíz par de número negativo', 'raíz n-ésima');
      }
      
      double exponente = 1 / n;
      double resultado;
      
      if (numero < 0) {
        // Para raíces impares de números negativos
        resultado = -pow(-numero, exponente);
      } else {
        resultado = pow(numero, exponente).toDouble();
      }
      
      if (resultado.isInfinite || resultado.isNaN) {
        return ResultadoMatematico.error('Resultado no válido', 'raíz n-ésima');
      }
      
      return ResultadoMatematico.exitoso(resultado, '$n√$numero');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'raíz n-ésima');
    }
  }
  
  // Funciones trigonométricas
  static ResultadoMatematico seno(double angulo, {bool enGrados = false}) {
    try {
      double anguloRad = enGrados ? angulo * pi / 180 : angulo;
      double resultado = sin(anguloRad);
      
      String unidad = enGrados ? '°' : ' rad';
      return ResultadoMatematico.exitoso(resultado, 'sen($angulo$unidad)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'seno');
    }
  }
  
  static ResultadoMatematico coseno(double angulo, {bool enGrados = false}) {
    try {
      double anguloRad = enGrados ? angulo * pi / 180 : angulo;
      double resultado = cos(anguloRad);
      
      String unidad = enGrados ? '°' : ' rad';
      return ResultadoMatematico.exitoso(resultado, 'cos($angulo$unidad)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'coseno');
    }
  }
  
  static ResultadoMatematico tangente(double angulo, {bool enGrados = false}) {
    try {
      double anguloRad = enGrados ? angulo * pi / 180 : angulo;
      
      // Verificar si está cerca de π/2 + n*π (donde tangente es indefinida)
      double valorCos = cos(anguloRad);
      if (valorCos.abs() < 1e-15) {
        return ResultadoMatematico.error('Tangente indefinida (cos = 0)', 'tangente');
      }
      
      double resultado = tan(anguloRad);
      
      if (resultado.isInfinite || resultado.isNaN) {
        return ResultadoMatematico.error('Tangente indefinida', 'tangente');
      }
      
      String unidad = enGrados ? '°' : ' rad';
      return ResultadoMatematico.exitoso(resultado, 'tan($angulo$unidad)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'tangente');
    }
  }
  
  // Funciones logarítmicas
  static ResultadoMatematico logaritmoNatural(double numero) {
    try {
      if (numero <= 0) {
        return ResultadoMatematico.error('Logaritmo requiere número positivo', 'ln');
      }
      
      double resultado = log(numero);
      return ResultadoMatematico.exitoso(resultado, 'ln($numero)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'logaritmo natural');
    }
  }
  
  static ResultadoMatematico logaritmoBase10(double numero) {
    try {
      if (numero <= 0) {
        return ResultadoMatematico.error('Logaritmo requiere número positivo', 'log₁₀');
      }
      
      double resultado = log(numero) / log(10);
      return ResultadoMatematico.exitoso(resultado, 'log₁₀($numero)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'logaritmo base 10');
    }
  }
  
  static ResultadoMatematico logaritmoBase(double numero, double base) {
    try {
      if (numero <= 0) {
        return ResultadoMatematico.error('Número debe ser positivo', 'logaritmo');
      }
      if (base <= 0 || base == 1) {
        return ResultadoMatematico.error('Base debe ser positiva y diferente de 1', 'logaritmo');
      }
      
      double resultado = log(numero) / log(base);
      return ResultadoMatematico.exitoso(resultado, 'log₍$base₎($numero)');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'logaritmo');
    }
  }
  
  // Función exponencial
  static ResultadoMatematico exponencial(double exponente) {
    try {
      double resultado = exp(exponente);
      
      if (resultado.isInfinite) {
        return ResultadoMatematico.error('Resultado infinito', 'exponencial');
      }
      
      return ResultadoMatematico.exitoso(resultado, 'e^$exponente');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'exponencial');
    }
  }
  
  // Factorial
  static ResultadoMatematico factorial(int n) {
    try {
      if (n < 0) {
        return ResultadoMatematico.error('Factorial de número negativo', 'factorial');
      }
      if (n > 170) {
        return ResultadoMatematico.error('Factorial muy grande (>170)', 'factorial');
      }
      
      double resultado = 1;
      for (int i = 2; i <= n; i++) {
        resultado *= i;
      }
      
      return ResultadoMatematico.exitoso(resultado, '$n!');
    } catch (e) {
      return ResultadoMatematico.error(e.toString(), 'factorial');
    }
  }
}

void main() {
  print('🧮 CALCULADORA CIENTÍFICA\n');
  
  // Probar operaciones básicas
  print('➕ OPERACIONES BÁSICAS:');
  print(CalculadoraCientifica.sumar(5, 3));
  print(CalculadoraCientifica.dividir(10, 3));
  print(CalculadoraCientifica.dividir(10, 0)); // Error esperado
  print('');
  
  // Probar potenciación y raíces
  print('⚡ POTENCIACIÓN Y RAÍCES:');
  print(CalculadoraCientifica.potencia(2, 8));
  print(CalculadoraCientifica.potencia(-2, 0.5)); // Error esperado
  print(CalculadoraCientifica.raizCuadrada(16));
  print(CalculadoraCientifica.raizCuadrada(-4)); // Error esperado
  print(CalculadoraCientifica.raizN(27, 3));
  print(CalculadoraCientifica.raizN(-8, 3)); // Válido (raíz impar)
  print('');
  
  // Probar trigonometría
  print('📐 FUNCIONES TRIGONOMÉTRICAS:');
  print(CalculadoraCientifica.seno(30, enGrados: true));
  print(CalculadoraCientifica.coseno(60, enGrados: true));
  print(CalculadoraCientifica.tangente(90, enGrados: true)); // Error esperado
  print(CalculadoraCientifica.seno(pi/6)); // 30 grados en radianes
  print('');
  
  // Probar logaritmos
  print('📊 FUNCIONES LOGARÍTMICAS:');
  print(CalculadoraCientifica.logaritmoNatural(e));
  print(CalculadoraCientifica.logaritmoBase10(100));
  print(CalculadoraCientifica.logaritmoBase(8, 2));
  print(CalculadoraCientifica.logaritmoNatural(-1)); // Error esperado
  print('');
  
  // Probar exponencial y factorial
  print('🚀 EXPONENCIAL Y FACTORIAL:');
  print(CalculadoraCientifica.exponencial(1));
  print(CalculadoraCientifica.factorial(5));
  print(CalculadoraCientifica.factorial(0)); // Caso especial: 0! = 1
  print(CalculadoraCientifica.factorial(-3)); // Error esperado
  print(CalculadoraCientifica.factorial(200)); // Error esperado (muy grande)
}
```

---

## 📊 Matriz de Evaluación Detallada

### 🎯 **Criterios por Ejercicio**

| Ejercicio | Conceptos Clave | Puntuación | Criterios Específicos |
|-----------|----------------|------------|---------------------|
| **1-3** (Básicos) | Funciones, parámetros, excepciones básicas | 25 pts | Sintaxis correcta, validaciones apropiadas |
| **4-5** (Intermedios) | Parámetros nombrados, clases, manejo avanzado | 35 pts | Modularización, excepciones personalizadas |
| **6-9** (Avanzados) | Algoritmos complejos, arquitectura robusta | 40 pts | Diseño elegante, manejo exhaustivo de casos |

### 📈 **Rúbrica de Calificación**

#### 🟢 **Excelente** (90-100%)
- Todas las funciones implementadas correctamente con parámetros apropiados
- Manejo completo y elegante de excepciones con mensajes informativos
- Código modular, reutilizable y bien documentado
- Validaciones exhaustivas y casos edge cubiertos
- Uso apropiado de diferentes tipos de parámetros y funciones

#### 🟡 **Bueno** (70-89%)
- Mayoría de funciones correctas con parámetros básicos
- Manejo básico de excepciones implementado
- Código funcional con modularización parcial
- Algunas validaciones y casos comunes cubiertos
- Uso correcto de conceptos fundamentales

#### 🟠 **Regular** (50-69%)
- Funciones básicas funcionan correctamente
- Try-catch implementado sin excepciones personalizadas
- Código funcional pero con poca modularización
- Validaciones mínimas, casos edge no cubiertos
- Comprensión parcial de conceptos avanzados

#### 🔴 **Insuficiente** (<50%)
- Errores de sintaxis en declaración de funciones
- Sin manejo de errores o implementación incorrecta
- Código no modular o no funcional
- Sin validaciones o validaciones incorrectas
- Comprensión insuficiente de conceptos básicos

---

## 🎓 **Notas para el Profesor**

### 📝 **Sugerencias de Evaluación**:
1. **Evaluación práctica**: Hacer que estudiantes expliquen el flujo de manejo de errores
2. **Debugging en vivo**: Resolver errores de funciones juntos en clase
3. **Refactoring**: Mejorar código existente aplicando principios de funciones
4. **Code review**: Análisis entre pares de diferentes aproximaciones

### ⏰ **Gestión del Tiempo**:
- **Ejercicios 1-3**: 60-90 minutos
- **Ejercicios 4-5**: 90-120 minutos  
- **Ejercicios 6-9**: 120-180 minutos

### 🔄 **Actividades Complementarias**:
- **Testing de funciones**: Crear casos de prueba para funciones de otros estudiantes
- **API Design**: Diseñar la interfaz de funciones antes de implementar
- **Error handling patterns**: Identificar y catalogar patrones comunes de manejo de errores
- **Performance comparison**: Comparar diferentes implementaciones de la misma función

### 💡 **Extensiones Creativas**:
- **Calculator CLI**: Convertir ejercicios en aplicaciones de línea de comandos
- **Function library**: Crear una librería reutilizable de funciones matemáticas
- **Error reporting system**: Sistema completo de reporte y logging de errores
- **Interactive tutorials**: Crear tutoriales interactivos sobre conceptos específicos

---

**✨ ¡Funciones y manejo de errores dominados con maestría!**

*Las funciones son la base de la programación modular. El manejo apropiado de errores es lo que diferencia el código profesional del amateur. ¡Excelente trabajo construyendo estas habilidades fundamentales!*