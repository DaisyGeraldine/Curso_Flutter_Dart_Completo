# Respuestas - Introducción a Dart

## Ejercicio 1: Investigación básica

### 1. ¿Por qué Dart es popular para Flutter?
- **Rendimiento nativo:** Dart compila a código nativo ARM y x64, proporcionando alto rendimiento
- **Hot reload:** Permite ver cambios instantáneamente durante el desarrollo
- **Sintaxis familiar:** Similar a Java/JavaScript, fácil de aprender
- **Tipado fuerte:** Detecta errores en tiempo de compilación
- **Diseñado para UI:** Optimizado para crear interfaces de usuario reactivas
- **Null safety:** Previene errores comunes de referencia nula

### 2. ¿Qué ventajas tiene Dart frente a JavaScript?
- **Tipado fuerte:** JavaScript es dinámico, Dart tiene tipos estáticos
- **Null safety:** Dart previene errores de null, JavaScript no
- **Compilación:** Dart compila a nativo, JavaScript es interpretado
- **Rendimiento:** Dart es más rápido en aplicaciones complejas
- **Herramientas:** Mejor soporte de IDE y debugging
- **Estructura:** Dart fuerza mejores prácticas de programación

### 3. ¿Diferencias entre compilación AOT y JIT?
- **AOT (Ahead of Time):**
  - Compila antes de ejecutar
  - Mejor rendimiento en producción
  - Archivos más grandes
  - Usado en apps Flutter release
  
- **JIT (Just in Time):**
  - Compila durante la ejecución
  - Permite hot reload
  - Desarrollo más rápido
  - Usado en modo debug/development

## Ejercicio 2: Tabla comparativa

| Aspecto | Dart | JavaScript | Java |
|---------|------|------------|------|
| **Sintaxis** | Similar a Java/C# | Flexible, dinámico | Verboso, estructurado |
| **Tipado** | Fuerte, opcional | Dinámico/débil | Fuerte, estático |
| **Rendimiento** | Alto (compilado) | Medio (interpretado) | Alto (JVM) |
| **Plataformas** | Móvil, web, desktop | Web, servidor | Multiplataforma (JVM) |
| **Curva de aprendizaje** | Media | Fácil inicio | Media-alta |
| **Null safety** | Incorporado | No nativo | Limitado |
| **Hot reload** | Sí (Flutter) | Sí (con herramientas) | No nativo |

## Ejercicio 3: Aplicaciones famosas con Flutter/Dart

### Aplicaciones móviles populares:
1. **Google Ads** - App oficial de Google para gestión de anuncios
2. **Alibaba Xianyu** - Marketplace de segunda mano (55+ millones de usuarios)
3. **BMW** - App oficial de BMW para gestión de vehículos
4. **eBay Motors** - Aplicación de eBay para compra/venta de autos
5. **Tencent** - Varias apps de la empresa china
6. **Nubank** - Banco digital de Brasil (40+ millones de usuarios)

### Casos de uso por industria:
- **E-commerce:** Alibaba, eBay
- **Fintech:** Nubank, Google Pay
- **Automotriz:** BMW, Toyota
- **Social:** Tencent apps
- **Productividad:** Google Ads, Reflectly

## Recursos para profundizar
- [Flutter Showcase](https://flutter.dev/showcase)
- [Dart language tour](https://dart.dev/guides/language/language-tour)
- [Flutter samples](https://github.com/flutter/samples)
- [DartPad experiments](https://dartpad.dev/?)

## Notas para el profesor
- Enfatizar que Dart no es solo para Flutter
- Mostrar ejemplos de código en DartPad durante la clase
- Comparar sintaxis con lenguajes que los estudiantes ya conozcan
- Demostrar hot reload en vivo si es posible
