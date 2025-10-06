# 📱 Proyecto: Calculadora Simple en Dart

## 🎯 Descripción del proyecto

Crea una aplicación de consola que funcione como una calculadora básica, permitiendo al usuario realizar operaciones matemáticas fundamentales entre dos números. Este proyecto te ayudará a consolidar los conceptos de sintaxis básica de Dart mientras construyes tu primera aplicación funcional.

## 🎓 Objetivos de aprendizaje

Al completar este proyecto, serás capaz de:
- **Implementar** entrada y salida de datos por consola
- **Aplicar** operadores aritméticos en situaciones prácticas
- **Crear** funciones reutilizables para operaciones matemáticas
- **Manejar** diferentes tipos de datos (int, double, String)
- **Estructurar** un programa Dart de manera organizada
- **Validar** entrada de datos del usuario
- **Formatear** salidas de manera profesional

## 🛠️ Funcionalidades requeridas

### ✅ Funcionalidades básicas (obligatorias)
1. **Solicitar dos números** al usuario por consola
2. **Realizar operaciones básicas**:
   - Suma (+)
   - Resta (-)
   - Multiplicación (×)
   - División (÷)
3. **Mostrar resultados** formatados en consola
4. **Manejar división por cero** con mensaje de error apropiado

### 🚀 Funcionalidades avanzadas (opcionales)
5. **Menú interactivo** para seleccionar operaciones
6. **Validación de entrada** para números inválidos
7. **Opción de repetir** operaciones sin reiniciar
8. **Historial** de operaciones realizadas

## 📋 Especificaciones técnicas

### Entrada esperada
- **Número 1**: Cualquier número real (int o double)
- **Número 2**: Cualquier número real (int o double)
- **Operación**: Suma, resta, multiplicación o división

### Salida esperada
```
=== CALCULADORA SIMPLE ===
Ingrese el primer número: 15
Ingrese el segundo número: 3

--- RESULTADOS ---
15.0 + 3.0 = 18.0
15.0 - 3.0 = 12.0
15.0 × 3.0 = 45.0
15.0 ÷ 3.0 = 5.0

¿Desea realizar otra operación? (s/n): n
¡Gracias por usar la calculadora!
```

## 🏗️ Estructura del proyecto recomendada

```dart
// calculadora.dart
import 'dart:io';
import 'dart:math';

// Funciones principales
void main() {
  // Punto de entrada del programa
}

// Funciones de operaciones
double sumar(double a, double b) { /* ... */ }
double restar(double a, double b) { /* ... */ }
double multiplicar(double a, double b) { /* ... */ }
double? dividir(double a, double b) { /* ... */ }

// Funciones de utilidad
double? leerNumero(String mensaje) { /* ... */ }
void mostrarResultados(double a, double b) { /* ... */ }
bool deseaContinuar() { /* ... */ }
void mostrarMenu() { /* ... */ }
```

## 📝 Pasos de desarrollo sugeridos

### Paso 1: Configuración inicial (15 min)
1. **Crear** archivo `calculadora.dart`
2. **Importar** las librerías necesarias (`dart:io`)
3. **Crear** función `main()` básica
4. **Probar** que compila correctamente

### Paso 2: Funciones de operación (20 min)
1. **Implementar** función `sumar()`
2. **Implementar** función `restar()`
3. **Implementar** función `multiplicar()`
4. **Implementar** función `dividir()` con validación
5. **Probar** cada función individualmente

### Paso 3: Entrada de datos (15 min)
1. **Crear** función `leerNumero()` para entrada segura
2. **Implementar** validación de entrada
3. **Manejar** errores de conversión
4. **Probar** con diferentes tipos de entrada

### Paso 4: Salida formatada (10 min)
1. **Crear** función `mostrarResultados()`
2. **Formatear** números con decimales apropiados
3. **Crear** interfaz de usuario atractiva
4. **Añadir** separadores y títulos

### Paso 5: Integración y pruebas (20 min)
1. **Integrar** todas las funciones en `main()`
2. **Implementar** flujo principal del programa
3. **Añadir** opción de repetir operaciones
4. **Realizar** pruebas exhaustivas

## 🧪 Casos de prueba sugeridos

| Entrada 1 | Entrada 2 | Operación | Resultado esperado | Notas |
|-----------|-----------|-----------|-------------------|-------|
| 10 | 5 | Todas | 15, 5, 50, 2 | Caso básico |
| 7.5 | 2.5 | Todas | 10, 5, 18.75, 3 | Números decimales |
| 15 | 0 | División | Error | División por cero |
| -8 | 3 | Todas | -5, -11, -24, -2.67 | Números negativos |
| abc | 5 | Cualquiera | Error | Entrada inválida |

## ✅ Criterios de evaluación

### Funcionalidad (40 puntos)
- [ ] **10 pts**: Las 4 operaciones básicas funcionan correctamente
- [ ] **10 pts**: Maneja entrada de usuario por consola
- [ ] **10 pts**: Valida división por cero apropiadamente
- [ ] **10 pts**: Muestra resultados correctamente formatados

### Código (35 puntos)
- [ ] **10 pts**: Código bien estructurado con funciones separadas
- [ ] **10 pts**: Variables y funciones con nombres descriptivos
- [ ] **8 pts**: Manejo apropiado de tipos de datos
- [ ] **7 pts**: Comentarios útiles en el código

### Experiencia de usuario (25 puntos)
- [ ] **10 pts**: Interfaz de consola clara y fácil de usar
- [ ] **8 pts**: Mensajes de error informativos
- [ ] **7 pts**: Formateo profesional de la salida

## 🚀 Desafíos adicionales (Bonus)

- **+5 pts**: Implementar operaciones avanzadas (potencia, raíz cuadrada)
- **+5 pts**: Crear menú interactivo para seleccionar operaciones
- **+5 pts**: Guardar historial de operaciones
- **+5 pts**: Implementar calculadora científica básica

## 📚 Recursos de apoyo

### Documentación oficial
- [Dart Language Tour - Functions](https://dart.dev/guides/language/language-tour#functions)
- [Dart I/O Library](https://api.dart.dev/stable/dart-io/dart-io-library.html)
- [Dart Math Library](https://api.dart.dev/stable/dart-math/dart-math-library.html)

### Tutoriales útiles
- [Dart Console Input/Output](https://dart.dev/tutorials/server/cmdline)
- [Error Handling in Dart](https://dart.dev/guides/language/language-tour#exceptions)

### Herramientas
- [DartPad](https://dartpad.dev) - Para probar código online
- [Dart DevTools](https://dart.dev/tools/dart-devtools) - Para debugging avanzado

## 🔧 Comandos útiles

```bash
# Crear proyecto
mkdir calculadora_simple
cd calculadora_simple

# Ejecutar programa
dart run calculadora.dart

# Compilar a ejecutable
dart compile exe calculadora.dart

# Analizar código
dart analyze calculadora.dart

# Formatear código
dart format calculadora.dart
```

## 💡 Tips para el éxito

1. **Empieza simple**: Comienza con la funcionalidad básica y ve añadiendo características gradualmente
2. **Prueba frecuentemente**: Ejecuta tu código después de cada función implementada
3. **Maneja errores**: Siempre considera qué puede salir mal (división por cero, entrada inválida)
4. **Código limpio**: Usa nombres descriptivos y mantén las funciones pequeñas
5. **Comenta tu código**: Explica la lógica compleja para referencia futura

## 🎯 Entregables

1. **Archivo principal**: `calculadora.dart` completamente funcional
2. **Documentación**: Comentarios en el código explicando la lógica
3. **Casos de prueba**: Evidencia de que has probado diferentes escenarios
4. **README**: Instrucciones de cómo ejecutar tu programa (opcional)

## ⏰ Tiempo estimado

- **Principiantes**: 2-3 horas
- **Intermedios**: 1-1.5 horas
- **Con experiencia**: 45-60 minutos

---

**¡Buena suerte con tu calculadora! 🚀**

*Recuerda: La programación se aprende practicando. No tengas miedo de experimentar y cometer errores.*
