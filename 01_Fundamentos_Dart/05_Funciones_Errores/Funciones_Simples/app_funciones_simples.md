# 📱 App de Funciones Simples - Proyecto Flutter

## 🎯 Descripción del Proyecto

Esta aplicación Flutter permite a los estudiantes **visualizar y experimentar** con diferentes tipos de funciones de Dart de manera interactiva. Los conceptos teóricos cobran vida a través de una interfaz gráfica intuitiva donde pueden probar parámetros, ver resultados en tiempo real y observar el manejo de errores.

## 🎓 Objetivos Pedagógicos

### ✅ **Objetivos principales**
- **Visualizar** el comportamiento de funciones con diferentes tipos de parámetros
- **Experimentar** con validaciones y manejo de errores en tiempo real
- **Consolidar** conceptos teóricos a través de práctica interactiva
- **Desarrollar** intuición sobre cuándo usar cada tipo de función
- **Comprender** la importancia del manejo robusto de errores

### 🔧 **Habilidades técnicas**
- Implementación de funciones con diferentes tipos de parámetros
- Manejo de estado en Flutter con `StatefulWidget`
- Validación de entrada de usuario en interfaces gráficas
- Diseño de UI/UX para aplicaciones educativas
- Integración de lógica de negocio con interfaces de usuario

---

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── models/
│   ├── calculator_result.dart # Modelo para encapsular resultados
│   └── validation_result.dart # Modelo para validaciones
├── screens/
│   ├── home_screen.dart      # Pantalla principal con navegación
│   ├── geometry_screen.dart  # Calculadora de formas geométricas
│   ├── temperature_screen.dart # Conversor de temperaturas
│   └── validation_screen.dart # Validador de datos
├── widgets/
│   ├── result_card.dart      # Widget para mostrar resultados
│   ├── input_field.dart      # Campo de entrada personalizado
│   └── error_dialog.dart     # Diálogo para mostrar errores
└── utils/
    ├── calculator_functions.dart # Funciones de cálculo
    ├── temperature_converter.dart # Funciones de conversión
    └── data_validator.dart      # Funciones de validación
```

---

## 📱 Pantallas de la Aplicación

### 🏠 **Pantalla Principal (Home)**
Dashboard con acceso a las diferentes demostraciones de funciones:

```dart
// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'geometry_screen.dart';
import 'temperature_screen.dart';
import 'validation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔧 Funciones en Acción'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade600, Colors.blue.shade100],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Explora las Funciones de Dart',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Aprende conceptos clave de manera interactiva',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildFunctionCard(
                      context,
                      title: 'Calculadora\nGeométrica',
                      description: 'Funciones con\nparámetros',
                      icon: Icons.calculate,
                      color: Colors.green,
                      onTap: () => _navigateToScreen(context, const GeometryScreen()),
                    ),
                    _buildFunctionCard(
                      context,
                      title: 'Conversor\nTemperaturas',
                      description: 'Funciones con\nvalidación',
                      icon: Icons.thermostat,
                      color: Colors.orange,
                      onTap: () => _navigateToScreen(context, const TemperatureScreen()),
                    ),
                    _buildFunctionCard(
                      context,
                      title: 'Validador\nde Datos',
                      description: 'Manejo de\nerrores',
                      icon: Icons.verified_user,
                      color: Colors.purple,
                      onTap: () => _navigateToScreen(context, const ValidationScreen()),
                    ),
                    _buildFunctionCard(
                      context,
                      title: 'Conceptos\nClave',
                      description: 'Teoría y\nejemplos',
                      icon: Icons.school,
                      color: Colors.teal,
                      onTap: () => _showConceptsDialog(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFunctionCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      shadowColor: color.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.7)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void _showConceptsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎓 Conceptos Clave'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📐 Funciones con Parámetros:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('• Posicionales obligatorios\n• Opcionales con valores por defecto\n• Nombrados para claridad'),
              
              SizedBox(height: 16),
              Text('⚠️ Manejo de Errores:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('• Try-catch-finally\n• Excepciones personalizadas\n• Validación preventiva'),
              
              SizedBox(height: 16),
              Text('🔄 Tipos de Retorno:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('• void (sin retorno)\n• Tipos específicos (int, double, String)\n• Objetos complejos'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }
}
```

---

### 📐 **Pantalla de Geometría**
Demostración de funciones con diferentes tipos de parámetros:

```dart
// lib/screens/geometry_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/calculator_functions.dart';
import '../models/calculator_result.dart';
import '../widgets/result_card.dart';
import '../widgets/input_field.dart';

class GeometryScreen extends StatefulWidget {
  const GeometryScreen({super.key});

  @override
  State<GeometryScreen> createState() => _GeometryScreenState();
}

class _GeometryScreenState extends State<GeometryScreen> {
  final TextEditingController _radioController = TextEditingController();
  final TextEditingController _largoController = TextEditingController();
  final TextEditingController _anchoController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  List<CalculatorResult> _results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📐 Calculadora Geométrica'),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '🎯 Explora diferentes tipos de parámetros',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Sección Círculo
                    _buildSectionCard(
                      title: '⭕ Círculo - Parámetro Simple',
                      description: 'Función con un solo parámetro requerido',
                      children: [
                        InputField(
                          controller: _radioController,
                          label: 'Radio',
                          hint: 'Ingresa el radio del círculo',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _calculateCircleArea,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Calcular Área'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Sección Rectángulo
                    _buildSectionCard(
                      title: '⬜ Rectángulo - Parámetros Múltiples',
                      description: 'Función con múltiples parámetros requeridos',
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                controller: _largoController,
                                label: 'Largo',
                                hint: 'Largo',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InputField(
                                controller: _anchoController,
                                label: 'Ancho',
                                hint: 'Ancho',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _calculateRectangleArea,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Calcular Área'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Sección Triángulo
                    _buildSectionCard(
                      title: '🔺 Triángulo - Parámetros Nombrados',
                      description: 'Función con parámetros nombrados para claridad',
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                controller: _baseController,
                                label: 'Base',
                                hint: 'Base del triángulo',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InputField(
                                controller: _alturaController,
                                label: 'Altura',
                                hint: 'Altura del triángulo',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _calculateTriangleArea,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Calcular Área'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Botón limpiar
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _clearAll,
                            icon: const Icon(Icons.clear_all),
                            label: const Text('Limpiar Todo'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _showExplanation,
                            icon: const Icon(Icons.info_outline),
                            label: const Text('¿Cómo funciona?'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              side: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Sección de resultados
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.history, color: Colors.green),
                          const SizedBox(width: 8),
                          const Text(
                            'Historial de Cálculos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${_results.length} resultado${_results.length != 1 ? 's' : ''}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _results.isEmpty
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calculate_outlined, 
                                      size: 48, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text('Realiza un cálculo para ver los resultados',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: _results.length,
                              itemBuilder: (context, index) {
                                final result = _results[_results.length - 1 - index];
                                return ResultCard(result: result);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  void _calculateCircleArea() {
    final radioText = _radioController.text.trim();
    if (radioText.isEmpty) {
      _showError('Por favor ingresa el radio');
      return;
    }

    try {
      final radio = double.parse(radioText);
      final result = CalculatorFunctions.calculateCircleArea(radio);
      _addResult(result);
    } catch (e) {
      _showError('Error: ${e.toString()}');
    }
  }

  void _calculateRectangleArea() {
    final largoText = _largoController.text.trim();
    final anchoText = _anchoController.text.trim();
    
    if (largoText.isEmpty || anchoText.isEmpty) {
      _showError('Por favor ingresa largo y ancho');
      return;
    }

    try {
      final largo = double.parse(largoText);
      final ancho = double.parse(anchoText);
      final result = CalculatorFunctions.calculateRectangleArea(largo, ancho);
      _addResult(result);
    } catch (e) {
      _showError('Error: ${e.toString()}');
    }
  }

  void _calculateTriangleArea() {
    final baseText = _baseController.text.trim();
    final alturaText = _alturaController.text.trim();
    
    if (baseText.isEmpty || alturaText.isEmpty) {
      _showError('Por favor ingresa base y altura');
      return;
    }

    try {
      final base = double.parse(baseText);
      final altura = double.parse(alturaText);
      final result = CalculatorFunctions.calculateTriangleArea(
        base: base, 
        altura: altura
      );
      _addResult(result);
    } catch (e) {
      _showError('Error: ${e.toString()}');
    }
  }

  void _addResult(CalculatorResult result) {
    setState(() {
      _results.add(result);
      if (_results.length > 10) {
        _results.removeAt(0); // Mantener solo los últimos 10
      }
    });

    // Haptic feedback
    HapticFeedback.lightImpact();
  }

  void _clearAll() {
    setState(() {
      _radioController.clear();
      _largoController.clear();
      _anchoController.clear();
      _baseController.clear();
      _alturaController.clear();
      _results.clear();
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showExplanation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🔧 ¿Cómo funcionan estas funciones?'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📐 Círculo (Parámetro Simple):', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('double areaCirculo(double radio)\n• Un solo parámetro requerido\n• Validación interna del valor'),
              
              SizedBox(height: 12),
              Text('⬜ Rectángulo (Parámetros Múltiples):', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('double areaRectangulo(double largo, double ancho)\n• Dos parámetros posicionales\n• Orden específico requerido'),
              
              SizedBox(height: 12),
              Text('🔺 Triángulo (Parámetros Nombrados):', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('double areaTriangulo({required double base, required double altura})\n• Parámetros nombrados\n• Mayor claridad en la llamada'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _radioController.dispose();
    _largoController.dispose();
    _anchoController.dispose();
    _baseController.dispose();
    _alturaController.dispose();
    super.dispose();
  }
}
```

---

### 🌡️ **Pantalla de Temperaturas**
Demostración de validación y manejo de errores:

```dart
// lib/screens/temperature_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/temperature_converter.dart';
import '../models/calculator_result.dart';
import '../widgets/result_card.dart';
import '../widgets/input_field.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _temperatureController = TextEditingController();
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  List<CalculatorResult> _results = [];

  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌡️ Conversor de Temperaturas'),
        backgroundColor: Colors.orange.shade600,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '🎯 Experimenta con validación y manejo de errores',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '🌡️ Conversor de Temperatura',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Las funciones validan que no estés bajo el cero absoluto',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Campo de temperatura
                            InputField(
                              controller: _temperatureController,
                              label: 'Temperatura',
                              hint: 'Ingresa la temperatura a convertir',
                              keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, 
                                signed: true
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => _temperatureController.clear(),
                                icon: const Icon(Icons.clear),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Selectores de unidades
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'De:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: DropdownButton<String>(
                                          value: _fromUnit,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: _units.map((unit) {
                                            return DropdownMenuItem(
                                              value: unit,
                                              child: Row(
                                                children: [
                                                  _getUnitIcon(unit),
                                                  const SizedBox(width: 8),
                                                  Text(unit),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _fromUnit = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: IconButton(
                                    onPressed: _swapUnits,
                                    icon: const Icon(Icons.swap_horiz),
                                    iconSize: 32,
                                    color: Colors.orange,
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'A:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: DropdownButton<String>(
                                          value: _toUnit,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: _units.map((unit) {
                                            return DropdownMenuItem(
                                              value: unit,
                                              child: Row(
                                                children: [
                                                  _getUnitIcon(unit),
                                                  const SizedBox(width: 8),
                                                  Text(unit),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _toUnit = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            // Botones de acción
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton.icon(
                                    onPressed: _convertTemperature,
                                    icon: const Icon(Icons.calculate),
                                    label: const Text('Convertir'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: _showLimits,
                                    icon: const Icon(Icons.info_outline),
                                    label: const Text('Límites'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.orange,
                                      side: const BorderSide(color: Colors.orange),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Ejemplos rápidos
                            const Text(
                              '🚀 Prueba estos valores:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: [
                                _buildQuickButton('0', '0°C (congelación)'),
                                _buildQuickButton('100', '100°C (ebullición)'),
                                _buildQuickButton('-273.15', 'Cero absoluto'),
                                _buildQuickButton('-300', 'Bajo cero absoluto ❌'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _clearAll,
                            icon: const Icon(Icons.clear_all),
                            label: const Text('Limpiar'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Sección de resultados
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.history, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Text(
                            'Historial de Conversiones',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${_results.length} conversión${_results.length != 1 ? 'es' : ''}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _results.isEmpty
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.thermostat_outlined, 
                                      size: 48, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text('Realiza una conversión para ver los resultados',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: _results.length,
                              itemBuilder: (context, index) {
                                final result = _results[_results.length - 1 - index];
                                return ResultCard(result: result);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getUnitIcon(String unit) {
    switch (unit) {
      case 'Celsius':
        return const Icon(Icons.ac_unit, size: 16, color: Colors.blue);
      case 'Fahrenheit':
        return const Icon(Icons.whatshot, size: 16, color: Colors.red);
      case 'Kelvin':
        return const Icon(Icons.science, size: 16, color: Colors.purple);
      default:
        return const Icon(Icons.device_thermostat, size: 16);
    }
  }

  Widget _buildQuickButton(String value, String description) {
    return Tooltip(
      message: description,
      child: OutlinedButton(
        onPressed: () {
          _temperatureController.text = value;
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.orange,
          side: const BorderSide(color: Colors.orange),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  void _convertTemperature() {
    final tempText = _temperatureController.text.trim();
    if (tempText.isEmpty) {
      _showError('Por favor ingresa una temperatura');
      return;
    }

    try {
      final temperature = double.parse(tempText);
      final result = TemperatureConverter.convert(
        temperature: temperature,
        from: _fromUnit,
        to: _toUnit,
      );
      _addResult(result);
    } catch (e) {
      _showError('Error: ${e.toString()}');
    }
  }

  void _swapUnits() {
    setState(() {
      final temp = _fromUnit;
      _fromUnit = _toUnit;
      _toUnit = temp;
    });
  }

  void _addResult(CalculatorResult result) {
    setState(() {
      _results.add(result);
      if (_results.length > 10) {
        _results.removeAt(0); // Mantener solo las últimas 10
      }
    });

    // Haptic feedback
    HapticFeedback.lightImpact();
  }

  void _clearAll() {
    setState(() {
      _temperatureController.clear();
      _results.clear();
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showLimits() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🌡️ Límites de Temperatura'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('❄️ Cero Absoluto:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('• Celsius: -273.15°C\n• Fahrenheit: -459.67°F\n• Kelvin: 0 K'),
              
              SizedBox(height: 16),
              Text('🔥 Referencias Útiles:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('• Congelación del agua: 0°C / 32°F / 273.15 K\n• Ebullición del agua: 100°C / 212°F / 373.15 K\n• Temperatura corporal: 37°C / 98.6°F / 310.15 K'),
              
              SizedBox(height: 16),
              Text('⚠️ Validación:', 
                style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Las funciones validan que la temperatura no esté por debajo del cero absoluto, que es físicamente imposible.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _temperatureController.dispose();
    super.dispose();
  }
}
```

---

## 🔧 **Modelos y Utilidades**

### 📊 **Modelo de Resultado**
```dart
// lib/models/calculator_result.dart
class CalculatorResult {
  final String operation;
  final String formula;
  final double? value;
  final bool isSuccess;
  final String? error;
  final DateTime timestamp;

  CalculatorResult.success({
    required this.operation,
    required this.formula,
    required this.value,
  })  : isSuccess = true,
        error = null,
        timestamp = DateTime.now();

  CalculatorResult.error({
    required this.operation,
    required this.error,
  })  : value = null,
        formula = '',
        isSuccess = false,
        timestamp = DateTime.now();

  @override
  String toString() {
    if (isSuccess) {
      return '$operation: $formula = ${value!.toStringAsFixed(2)}';
    } else {
      return 'Error en $operation: $error';
    }
  }
}
```

### 🧮 **Funciones de Cálculo**
```dart
// lib/utils/calculator_functions.dart
import 'dart:math';
import '../models/calculator_result.dart';

class CalculatorFunctions {
  
  // Función con parámetro simple
  static CalculatorResult calculateCircleArea(double radio) {
    try {
      if (radio < 0) {
        return CalculatorResult.error(
          operation: 'Área de Círculo',
          error: 'El radio no puede ser negativo',
        );
      }
      
      if (radio == 0) {
        return CalculatorResult.success(
          operation: 'Área de Círculo',
          formula: 'π × 0²',
          value: 0.0,
        );
      }

      final area = pi * radio * radio;
      
      return CalculatorResult.success(
        operation: 'Área de Círculo',
        formula: 'π × ${radio.toStringAsFixed(2)}²',
        value: area,
      );
    } catch (e) {
      return CalculatorResult.error(
        operation: 'Área de Círculo',
        error: 'Error inesperado: ${e.toString()}',
      );
    }
  }

  // Función con múltiples parámetros posicionales
  static CalculatorResult calculateRectangleArea(double largo, double ancho) {
    try {
      if (largo < 0 || ancho < 0) {
        return CalculatorResult.error(
          operation: 'Área de Rectángulo',
          error: 'Las dimensiones no pueden ser negativas',
        );
      }

      final area = largo * ancho;
      
      return CalculatorResult.success(
        operation: 'Área de Rectángulo',
        formula: '${largo.toStringAsFixed(2)} × ${ancho.toStringAsFixed(2)}',
        value: area,
      );
    } catch (e) {
      return CalculatorResult.error(
        operation: 'Área de Rectángulo',
        error: 'Error inesperado: ${e.toString()}',
      );
    }
  }

  // Función con parámetros nombrados
  static CalculatorResult calculateTriangleArea({
    required double base,
    required double altura,
  }) {
    try {
      if (base < 0 || altura < 0) {
        return CalculatorResult.error(
          operation: 'Área de Triángulo',
          error: 'Base y altura deben ser positivas',
        );
      }

      final area = (base * altura) / 2;
      
      return CalculatorResult.success(
        operation: 'Área de Triángulo',
        formula: '(${base.toStringAsFixed(2)} × ${altura.toStringAsFixed(2)}) ÷ 2',
        value: area,
      );
    } catch (e) {
      return CalculatorResult.error(
        operation: 'Área de Triángulo',
        error: 'Error inesperado: ${e.toString()}',
      );
    }
  }
}
```

### 🌡️ **Conversor de Temperaturas**
```dart
// lib/utils/temperature_converter.dart
import '../models/calculator_result.dart';

class TemperatureConverter {
  static const double _ceroAbsolutoCelsius = -273.15;
  static const double _ceroAbsolutoFahrenheit = -459.67;
  static const double _ceroAbsolutoKelvin = 0.0;

  static CalculatorResult convert({
    required double temperature,
    required String from,
    required String to,
  }) {
    try {
      // Validar cero absoluto según la unidad de origen
      _validateAbsoluteZero(temperature, from);

      if (from == to) {
        return CalculatorResult.success(
          operation: 'Conversión de Temperatura',
          formula: '$temperature° $from = $temperature° $to',
          value: temperature,
        );
      }

      double result;
      String formula;

      // Realizar conversión
      switch (from.toLowerCase()) {
        case 'celsius':
          result = _fromCelsius(temperature, to.toLowerCase());
          formula = _getCelsiusFormula(temperature, to, result);
          break;
        case 'fahrenheit':
          result = _fromFahrenheit(temperature, to.toLowerCase());
          formula = _getFahrenheitFormula(temperature, to, result);
          break;
        case 'kelvin':
          result = _fromKelvin(temperature, to.toLowerCase());
          formula = _getKelvinFormula(temperature, to, result);
          break;
        default:
          throw Exception('Unidad no soportada: $from');
      }

      return CalculatorResult.success(
        operation: 'Conversión de Temperatura',
        formula: formula,
        value: result,
      );
    } catch (e) {
      return CalculatorResult.error(
        operation: 'Conversión de Temperatura',
        error: e.toString(),
      );
    }
  }

  static void _validateAbsoluteZero(double temperature, String unit) {
    switch (unit.toLowerCase()) {
      case 'celsius':
        if (temperature < _ceroAbsolutoCelsius) {
          throw Exception(
            'Temperatura por debajo del cero absoluto (-273.15°C)'
          );
        }
        break;
      case 'fahrenheit':
        if (temperature < _ceroAbsolutoFahrenheit) {
          throw Exception(
            'Temperatura por debajo del cero absoluto (-459.67°F)'
          );
        }
        break;
      case 'kelvin':
        if (temperature < _ceroAbsolutoKelvin) {
          throw Exception(
            'Temperatura por debajo del cero absoluto (0 K)'
          );
        }
        break;
    }
  }

  static double _fromCelsius(double celsius, String to) {
    switch (to) {
      case 'fahrenheit':
        return (celsius * 9/5) + 32;
      case 'kelvin':
        return celsius + 273.15;
      default:
        throw Exception('Conversión no soportada: Celsius a $to');
    }
  }

  static double _fromFahrenheit(double fahrenheit, String to) {
    switch (to) {
      case 'celsius':
        return (fahrenheit - 32) * 5/9;
      case 'kelvin':
        final celsius = (fahrenheit - 32) * 5/9;
        return celsius + 273.15;
      default:
        throw Exception('Conversión no soportada: Fahrenheit a $to');
    }
  }

  static double _fromKelvin(double kelvin, String to) {
    switch (to) {
      case 'celsius':
        return kelvin - 273.15;
      case 'fahrenheit':
        final celsius = kelvin - 273.15;
        return (celsius * 9/5) + 32;
      default:
        throw Exception('Conversión no soportada: Kelvin a $to');
    }
  }

  static String _getCelsiusFormula(double celsius, String to, double result) {
    switch (to.toLowerCase()) {
      case 'fahrenheit':
        return '($celsius × 9/5) + 32 = ${result.toStringAsFixed(2)}°F';
      case 'kelvin':
        return '$celsius + 273.15 = ${result.toStringAsFixed(2)} K';
      default:
        return '$celsius°C = ${result.toStringAsFixed(2)}°$to';
    }
  }

  static String _getFahrenheitFormula(double fahrenheit, String to, double result) {
    switch (to.toLowerCase()) {
      case 'celsius':
        return '($fahrenheit - 32) × 5/9 = ${result.toStringAsFixed(2)}°C';
      case 'kelvin':
        return '(($fahrenheit - 32) × 5/9) + 273.15 = ${result.toStringAsFixed(2)} K';
      default:
        return '$fahrenheit°F = ${result.toStringAsFixed(2)}°$to';
    }
  }

  static String _getKelvinFormula(double kelvin, String to, double result) {
    switch (to.toLowerCase()) {
      case 'celsius':
        return '$kelvin - 273.15 = ${result.toStringAsFixed(2)}°C';
      case 'fahrenheit':
        return '(($kelvin - 273.15) × 9/5) + 32 = ${result.toStringAsFixed(2)}°F';
      default:
        return '$kelvin K = ${result.toStringAsFixed(2)}°$to';
    }
  }
}
```

---

## 🎯 **Guía de Implementación para Estudiantes**

### 📝 **Pasos para crear la app**:

1. **Crear proyecto Flutter**:
   ```bash
   flutter create app_funciones_simples
   cd app_funciones_simples
   ```

2. **Configurar estructura de archivos** según el diagrama mostrado

3. **Implementar gradualmente**:
   - Primero: Modelos básicos (`calculator_result.dart`)
   - Segundo: Funciones de utilidad (`calculator_functions.dart`)
   - Tercero: Widgets reutilizables (`result_card.dart`, `input_field.dart`)
   - Cuarto: Pantallas individuales
   - Quinto: Navegación y pantalla principal

4. **Probar cada función** individualmente antes de integrar

5. **Añadir validaciones** y manejo de errores progresivamente

### 🎨 **Personalización sugerida**:
- **Colores**: Cambiar paleta según preferencias
- **Iconos**: Usar iconos personalizados
- **Animaciones**: Añadir transiciones suaves
- **Sonidos**: Feedback auditivo para acciones
- **Tema**: Modo oscuro/claro

### 🧪 **Casos de prueba importantes**:
1. **Valores normales**: Números positivos típicos
2. **Casos edge**: Cero, números muy grandes/pequeños
3. **Errores esperados**: Valores negativos donde no corresponde
4. **Validaciones**: Entradas vacías, texto no numérico
5. **Límites físicos**: Temperaturas bajo cero absoluto

---

## 🎓 **Valor Pedagógico**

### ✅ **Conceptos reforzados**:
- **Tipos de parámetros**: Visual y prácticamente diferenciados
- **Validación de datos**: Errores mostrados en tiempo real
- **Encapsulación**: Resultados organizados en modelos
- **Reutilización**: Widgets y funciones reutilizables
- **UX/UI**: Importancia de interfaces intuitivas

### 🚀 **Habilidades desarrolladas**:
- **Pensamiento modular**: Separación de responsabilidades
- **Manejo de estado**: StatefulWidget y setState
- **Arquitectura MVC**: Separación de lógica y presentación
- **Testing mental**: Probar diferentes casos de uso
- **Debugging visual**: Ver errores en interfaz gráfica

### 🎯 **Preparación para conceptos avanzados**:
- **POO**: Los modelos introducen clases y objetos
- **Arquitectura**: Patrones de diseño en Flutter
- **Testing**: Base para unit tests y widget tests
- **Estado global**: Preparación para Provider/Bloc
- **APIs**: Estructura similar para llamadas HTTP

---

## ⏰ **Tiempo estimado de desarrollo**:
- **Principiantes**: 4-6 horas (con guía paso a paso)
- **Intermedios**: 2-3 horas (implementación directa)
- **Con experiencia**: 1-2 horas (enfoque en conceptos)

---

**🎉 ¡Esta app convierte conceptos abstractos en experiencias tangibles!**

*Los estudiantes no solo aprenden sintaxis, sino que ven cómo las funciones cobran vida en aplicaciones reales. La combinación de teoría sólida con práctica visual es la clave del aprendizaje efectivo.*