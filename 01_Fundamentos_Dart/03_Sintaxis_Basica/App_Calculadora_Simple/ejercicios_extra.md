# 🚀 Ejercicios Extra: Calculadora Simple

## 🎯 Descripción

Una vez completado el **ejercicio base** de la calculadora simple, estos ejercicios adicionales te permitirán practicar y profundizar en la **sintaxis básica de Dart** mediante mejoras progresivas a tu calculadora. Cada ejercicio construye sobre el anterior, manteniendo el enfoque en **aplicación de consola**.

> **📌 Requisito previo**: Tener completado el ejercicio base de la calculadora simple con las 4 operaciones básicas funcionando.

---

## 🟢 Nivel Básico
*Extensiones simples que refuerzan conceptos básicos*

### 📝 Ejercicio 1: Calculadora de Tres Números
**🎯 Objetivo**: Practicar manejo de múltiples variables y operaciones secuenciales

**📋 Descripción**: 
Modifica tu calculadora para que pueda trabajar con **tres números** en lugar de dos.

**🛠️ Tareas**:
- Solicitar tres números al usuario
- Realizar operaciones: `(num1 + num2) * num3`, `(num1 - num2) / num3`
- Mostrar ambos resultados formateados

**💡 Conceptos practicados**: Variables múltiples, precedencia de operadores, formateo de salida

**⏱️ Tiempo estimado**: 20-30 minutos

---

### 📝 Ejercicio 2: Validador de Resultados
**🎯 Objetivo**: Practicar condicionales simples y mensajes informativos

**📋 Descripción**: 
Mejora tu calculadora para que **analice y comente** los resultados obtenidos.

**🛠️ Tareas**:
- Si el resultado es negativo, mostrar: "⚠️ Resultado negativo: [valor]"
- Si el resultado es cero, mostrar: "🎯 Resultado exacto: cero"
- Si el resultado es mayor a 100, mostrar: "🚀 ¡Resultado grande!: [valor]"
- Si el resultado tiene decimales, mostrar: "🔢 Resultado decimal: [valor]"

**💡 Conceptos practicados**: Condicionales (`if-else`), comparación de números, interpolación de strings

**⏱️ Tiempo estimado**: 15-25 minutos

---

### 📝 Ejercicio 3: Selector de Operación
**🎯 Objetivo**: Practicar entrada de usuario y estructura de control switch

**📋 Descripción**: 
Permite al usuario **elegir qué operación** realizar en lugar de mostrar todas.

**🛠️ Tareas**:
- Mostrar menú: "1. Suma | 2. Resta | 3. Multiplicación | 4. División"
- Leer la opción del usuario
- Realizar solo la operación seleccionada
- Manejar opciones inválidas con mensaje de error

**💡 Conceptos practicados**: `switch-case`, entrada de usuario, validación básica

**⏱️ Tiempo estimado**: 25-35 minutos

---

## 🟡 Nivel Intermedio
*Mejoras que introducen conceptos adicionales de sintaxis*

### 📝 Ejercicio 4: Operaciones Extendidas
**🎯 Objetivo**: Practicar uso de la librería `dart:math` y funciones adicionales

**📋 Descripción**: 
Agrega **operaciones matemáticas adicionales** a tu calculadora.

**🛠️ Tareas**:
- Agregar opción 5: Potencia (`num1 ^ num2`)
- Agregar opción 6: Raíz cuadrada (solo del primer número)
- Agregar opción 7: Porcentaje (`num1% de num2`)
- Importar `dart:math` para usar `pow()` y `sqrt()`

**💡 Conceptos practicados**: Importación de librerías, funciones matemáticas, manejo de tipos

**⏱️ Tiempo estimado**: 30-40 minutos

---

### 📝 Ejercicio 5: Calculadora Repetitiva
**🎯 Objetivo**: Practicar bucles y control de flujo del programa

**📋 Descripción**: 
Permite realizar **múltiples operaciones** sin reiniciar el programa.

**🛠️ Tareas**:
- Después de cada operación, preguntar: "¿Realizar otra operación? (s/n)"
- Si responde 's', volver al inicio
- Si responde 'n', mostrar mensaje de despedida
- Validar que solo acepte 's' o 'n'

**💡 Conceptos practicados**: Bucles `while`, control de flujo, validación de entrada

**⏱️ Tiempo estimado**: 20-30 minutos

---

### 📝 Ejercicio 6: Validación Robusta
**🎯 Objetivo**: Practicar manejo de errores y conversión de tipos

**📋 Descripción**: 
Mejora la **validación de entrada** para que tu calculadora sea más resistente a errores.

**🛠️ Tareas**:
- Validar que la entrada sean números válidos
- Si el usuario ingresa texto, mostrar error y solicitar nuevamente
- Implementar validación para división por cero
- Crear función `leerNumeroSeguro()` que garantice entrada válida

**💡 Conceptos practicados**: `try-catch`, conversión de tipos, funciones de validación, bucles de retry

**⏱️ Tiempo estimado**: 35-45 minutos

---

## 🔴 Nivel Avanzado
*Desafíos que combinan múltiples conceptos de sintaxis*

### 📝 Ejercicio 7: Historial Simple
**🎯 Objetivo**: Practicar listas y manejo de colecciones básicas

**📋 Descripción**: 
Implementa un **historial básico** de las operaciones realizadas.

**🛠️ Tareas**:
- Crear una lista para guardar las operaciones: `List<String> historial = [];`
- Después de cada operación, guardar: "15 + 3 = 18"
- Agregar opción de menú: "8. Ver historial"
- Mostrar las últimas 5 operaciones realizadas
- Al salir, mostrar cuántas operaciones se realizaron en total

**💡 Conceptos practicados**: Listas, métodos de lista (`add`, `length`), iteración, formateo de strings

**⏱️ Tiempo estimado**: 40-50 minutos

---

### 📝 Ejercicio 8: Calculadora con Memoria
**🎯 Objetivo**: Practicar variables globales y funciones especializadas

**📋 Descripción**: 
Agrega funciones de **memoria** como las calculadoras reales.

**🛠️ Tareas**:
- Variable `double memoria = 0;`
- Opción "9. Guardar en memoria" (guarda último resultado)
- Opción "10. Recuperar de memoria" (usa valor de memoria como primer número)
- Opción "11. Limpiar memoria" (pone memoria en 0)
- Mostrar valor actual de memoria en el menú

**💡 Conceptos practicados**: Variables globales, funciones void, estado del programa

**⏱️ Tiempo estimado**: 30-40 minutos

---

## ✅ Lista de verificación

### Al completar los ejercicios básicos deberías tener:
- [ ] Calculadora que trabaja con 3 números
- [ ] Mensajes informativos sobre los resultados
- [ ] Menú interactivo para elegir operaciones
- [ ] Manejo básico de errores

### Al completar los ejercicios intermedios deberías tener:
- [ ] Operaciones matemáticas extendidas (potencia, raíz, porcentaje)
- [ ] Programa que permite múltiples operaciones sin reiniciar
- [ ] Validación robusta de entrada de datos
- [ ] Uso de librerías externas (`dart:math`)

### Al completar los ejercicios avanzados deberías tener:
- [ ] Historial de operaciones realizadas
- [ ] Sistema de memoria básico
- [ ] Programa completo y robusto
- [ ] Dominio sólido de sintaxis básica de Dart

---

## 🎯 Objetivo pedagógico

Estos ejercicios están diseñados para que practiques **progresivamente** los conceptos de sintaxis básica de Dart:

- **Variables y tipos de datos** (int, double, String, bool)
- **Operadores** (aritméticos, de comparación, lógicos)
- **Estructuras de control** (if-else, switch-case, while)
- **Funciones** (parámetros, retorno, void)
- **Entrada/Salida** por consola
- **Listas básicas** y colecciones simples
- **Importación** de librerías estándar
- **Manejo básico** de errores

---

## 💡 Consejos de implementación

1. **Desarrolla incrementalmente**: Completa un ejercicio antes de pasar al siguiente
2. **Prueba cada cambio**: Ejecuta tu programa después de cada modificación  
3. **Mantén tu código organizado**: Usa funciones para evitar repetición
4. **Comenta tu código**: Explica la lógica de partes complejas
5. **No tengas miedo de experimentar**: Estos ejercicios son para practicar

---

## ⏰ Tiempo total estimado

- **Ejercicios básicos (1-3)**: 1-1.5 horas
- **Ejercicios intermedios (4-6)**: 1.5-2 horas  
- **Ejercicios avanzados (7-8)**: 1-1.5 horas

**Total**: 3.5-5 horas de práctica intensiva de sintaxis básica

---

**¡Que disfrutes programando! 🚀**

*Recuerda: Cada ejercicio te acerca más al dominio de la sintaxis básica de Dart.*
