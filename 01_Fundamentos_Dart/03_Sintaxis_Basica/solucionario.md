# Solucionario - Sintaxis básica de Dart

## 🎯 Ejercicio 1: Variables y tipos básicos

### Solución completa:

```dart
void main() {
  // Declaración de variables con diferentes tipos
  
  // Números enteros
  int edad = 25;
  int año = 2024;
  
  // Números decimales
  double altura = 1.75;
  double peso = 68.5;
  double imc = peso / (altura * altura);
  
  // Cadenas de texto
  String nombre = "Ana García";
  String apellido = "López";
  String nombreCompleto = "$nombre $apellido";
  
  // Valores booleanos
  bool esEstudiante = true;
  bool esMayorDeEdad = edad >= 18;
  bool tieneDescuento = esEstudiante && esMayorDeEdad;
  
  // Mostrar valores en consola con formato descriptivo
  print("=== INFORMACIÓN PERSONAL ===");
  print("Nombre completo: $nombreCompleto");
  print("Edad: $edad años");
  print("Altura: ${altura}m");
  print("Peso: ${peso}kg");
  print("IMC: ${imc.toStringAsFixed(2)}");
  print("Es estudiante: $esEstudiante");
  print("Es mayor de edad: $esMayorDeEdad");
  print("Tiene descuento: $tieneDescuento");
  
  // Ejemplos con null safety
  String? telefono;  // Puede ser null
  String? email = "ana@example.com";
  
  print("\n=== INFORMACIÓN DE CONTACTO ===");
  print("Teléfono: ${telefono ?? 'No disponible'}");
  print("Email: ${email ?? 'No disponible'}");
  
  // Usando el operador de acceso seguro
  print("Longitud del email: ${email?.length ?? 0} caracteres");
}
```

### Salida esperada:
```
=== INFORMACIÓN PERSONAL ===
Nombre completo: Ana García López
Edad: 25 años
Altura: 1.75m
Peso: 68.5kg
IMC: 22.37
Es estudiante: true
Es mayor de edad: true
Tiene descuento: true

=== INFORMACIÓN DE CONTACTO ===
Teléfono: No disponible
Email: ana@example.com
Longitud del email: 16 caracteres
```

## 🧮 Ejercicio 2: Operaciones aritméticas (Calculadora)

### Solución completa:

```dart
void main() {
  // Declaración de dos números para las operaciones
  double numero1 = 15.0;
  double numero2 = 4.0;
  
  print("=== CALCULADORA BÁSICA ===");
  print("Número 1: $numero1");
  print("Número 2: $numero2");
  print("");
  
  // Operaciones aritméticas básicas
  double suma = numero1 + numero2;
  double resta = numero1 - numero2;
  double multiplicacion = numero1 * numero2;
  double division = numero1 / numero2;
  int divisionEntera = numero1 ~/ numero2;
  double modulo = numero1 % numero2;
  
  print("=== OPERACIONES BÁSICAS ===");
  print("$numero1 + $numero2 = $suma");
  print("$numero1 - $numero2 = $resta");
  print("$numero1 × $numero2 = $multiplicacion");
  print("$numero1 ÷ $numero2 = ${division.toStringAsFixed(2)}");
  print("$numero1 ÷÷ $numero2 = $divisionEntera (división entera)");
  print("$numero1 % $numero2 = $modulo (resto)");
  
  // Operaciones más complejas
  double potencia = numero1 * numero1;  // Simulando potencia
  double raizCuadrada = 16.0;  // Para mostrar raíz
  
  print("\n=== OPERACIONES AVANZADAS ===");
  print("$numero1² = $potencia");
  print("√$raizCuadrada = ${raizCuadrada / 4}");
  
  // Operadores de incremento y decremento
  int contador = 10;
  print("\n=== INCREMENTOS Y DECREMENTOS ===");
  print("Valor inicial: $contador");
  
  contador++;
  print("Después de contador++: $contador");
  
  ++contador;
  print("Después de ++contador: $contador");
  
  contador--;
  print("Después de contador--: $contador");
  
  --contador;
  print("Después de --contador: $contador");
  
  // Operadores de asignación
  int valor = 20;
  print("\n=== OPERADORES DE ASIGNACIÓN ===");
  print("Valor inicial: $valor");
  
  valor += 5;
  print("Después de valor += 5: $valor");
  
  valor -= 3;
  print("Después de valor -= 3: $valor");
  
  valor *= 2;
  print("Después de valor *= 2: $valor");
  
  valor ~/= 4;
  print("Después de valor ~/= 4: $valor");
}
```

### Salida esperada:
```
=== CALCULADORA BÁSICA ===
Número 1: 15.0
Número 2: 4.0

=== OPERACIONES BÁSICAS ===
15.0 + 4.0 = 19.0
15.0 - 4.0 = 11.0
15.0 × 4.0 = 60.0
15.0 ÷ 4.0 = 3.75
15.0 ÷÷ 4.0 = 3 (división entera)
15.0 % 4.0 = 3.0 (resto)

=== OPERACIONES AVANZADAS ===
15.0² = 225.0
√16.0 = 4.0

=== INCREMENTOS Y DECREMENTOS ===
Valor inicial: 10
Después de contador++: 11
Después de ++contador: 12
Después de contador--: 11
Después de --contador: 10

=== OPERADORES DE ASIGNACIÓN ===
Valor inicial: 20
Después de valor += 5: 25
Después de valor -= 3: 22
Después de valor *= 2: 44
Después de valor ~/= 4: 11
```

## 🧠 Ejercicio 3: Operadores lógicos y condicionales

### Solución completa:

```dart
void main() {
  // Variables para demostrar operadores lógicos
  bool esEstudiante = true;
  bool tieneBeca = false;
  bool esMayorDeEdad = true;
  int edad = 20;
  double promedio = 8.5;
  
  print("=== DATOS DEL ESTUDIANTE ===");
  print("Es estudiante: $esEstudiante");
  print("Tiene beca: $tieneBeca");
  print("Es mayor de edad: $esMayorDeEdad");
  print("Edad: $edad años");
  print("Promedio: $promedio");
  
  // Operadores lógicos básicos
  print("\n=== OPERADORES LÓGICOS ===");
  print("!esEstudiante = ${!esEstudiante}");
  print("esEstudiante && tieneBeca = ${esEstudiante && tieneBeca}");
  print("esEstudiante || tieneBeca = ${esEstudiante || tieneBeca}");
  print("!tieneBeca && esMayorDeEdad = ${!tieneBeca && esMayorDeEdad}");
  
  // Operadores de comparación
  print("\n=== OPERADORES DE COMPARACIÓN ===");
  print("edad >= 18: ${edad >= 18}");
  print("promedio > 7.0: ${promedio > 7.0}");
  print("promedio == 8.5: ${promedio == 8.5}");
  print("promedio != 10.0: ${promedio != 10.0}");
  
  // Operador ternario (condicional)
  print("\n=== OPERADOR TERNARIO ===");
  String estadoEdad = edad >= 18 ? "Mayor de edad" : "Menor de edad";
  String estadoPromedio = promedio >= 8.0 ? "Excelente" : 
                         promedio >= 7.0 ? "Bueno" : "Regular";
  String estadoBeca = tieneBeca ? "Con beca" : "Sin beca";
  
  print("Estado por edad: $estadoEdad");
  print("Estado académico: $estadoPromedio");
  print("Estado de beca: $estadoBeca");
  
  // Evaluaciones complejas
  print("\n=== EVALUACIONES COMPLEJAS ===");
  bool puedeGraduarse = esEstudiante && promedio >= 7.0 && esMayorDeEdad;
  bool necesitaApoyo = !tieneBeca && promedio < 8.0;
  bool esExcelente = promedio >= 9.0 && esEstudiante;
  
  print("Puede graduarse: $puedeGraduarse");
  print("Necesita apoyo económico: $necesitaApoyo");
  print("Es estudiante excelente: $esExcelente");
  
  // Manejo de valores nullable
  print("\n=== MANEJO DE VALORES NULLABLE ===");
  String? email;
  String? telefono = "555-1234";
  int? codigoPostal;
  
  // Operador null-coalescing (??)
  String emailFinal = email ?? "sin-email@ejemplo.com";
  String telefonoFinal = telefono ?? "Sin teléfono";
  int codigoFinal = codigoPostal ?? 0;
  
  print("Email: $emailFinal");
  print("Teléfono: $telefonoFinal");
  print("Código postal: $codigoFinal");
  
  // Operador de asignación condicional (??=)
  String? nombre;
  nombre ??= "Anónimo";  // Solo asigna si es null
  print("Nombre: $nombre");
  
  nombre ??= "Otro nombre";  // No asigna porque ya tiene valor
  print("Nombre después de segunda asignación: $nombre");
}
```

### Salida esperada:
```
=== DATOS DEL ESTUDIANTE ===
Es estudiante: true
Tiene beca: false
Es mayor de edad: true
Edad: 20 años
Promedio: 8.5

=== OPERADORES LÓGICOS ===
!esEstudiante = false
esEstudiante && tieneBeca = false
esEstudiante || tieneBeca = true
!tieneBeca && esMayorDeEdad = true

=== OPERADORES DE COMPARACIÓN ===
edad >= 18: true
promedio > 7.0: true
promedio == 8.5: true
promedio != 10.0: true

=== OPERADOR TERNARIO ===
Estado por edad: Mayor de edad
Estado académico: Excelente
Estado de beca: Sin beca

=== EVALUACIONES COMPLEJAS ===
Puede graduarse: true
Necesita apoyo económico: true
Es estudiante excelente: false

=== MANEJO DE VALORES NULLABLE ===
Email: sin-email@ejemplo.com
Teléfono: 555-1234
Código postal: 0
Nombre: Anónimo
Nombre después de segunda asignación: Anónimo
```

## 🔤 Ejercicio 4: Interpolación y formateo de strings

### Solución completa:

```dart
void main() {
  // Datos del usuario
  String nombre = "Carlos";
  String apellido = "Mendoza";
  int edad = 28;
  double salario = 45000.50;
  bool esCasado = true;
  DateTime fechaNacimiento = DateTime(1996, 3, 15);
  List<String> hobbies = ["programación", "lectura", "ciclismo"];
  
  // Interpolación básica
  print("=== PERFIL DE USUARIO ===");
  print("Nombre completo: $nombre $apellido");
  print("Edad: $edad años");
  
  // Interpolación con expresiones
  print("Nació en: ${fechaNacimiento.year}");
  print("Salario anual: \$${salario.toStringAsFixed(2)}");
  print("Salario mensual: \$${(salario / 12).toStringAsFixed(2)}");
  print("Estado civil: ${esCasado ? 'Casado' : 'Soltero'}");
  
  // Interpolación con métodos de string
  print("\n=== INFORMACIÓN ADICIONAL ===");
  print("Iniciales: ${nombre[0]}.${apellido[0]}.");
  print("Nombre en mayúsculas: ${nombre.toUpperCase()}");
  print("Apellido en minúsculas: ${apellido.toLowerCase()}");
  print("Longitud del nombre completo: ${(nombre + apellido).length} caracteres");
  
  // Interpolación con listas
  print("\n=== HOBBIES ===");
  print("Número de hobbies: ${hobbies.length}");
  print("Primer hobby: ${hobbies.first}");
  print("Último hobby: ${hobbies.last}");
  print("Todos los hobbies: ${hobbies.join(', ')}");
  
  // Strings multilínea con interpolación
  String resumen = '''
=== RESUMEN COMPLETO ===
Nombre: $nombre $apellido
Edad: $edad años (nacido en ${fechaNacimiento.year})
Salario: \$${salario.toStringAsFixed(2)} anuales
Estado: ${esCasado ? 'Casado' : 'Soltero'}
Hobbies favoritos: ${hobbies.take(2).join(' y ')}
Tiempo hasta jubilación: ${65 - edad} años
''';
  
  print(resumen);
  
  // Formateo avanzado con padding y alineación
  print("=== TABLA DE INFORMACIÓN ===");
  print("|${'Campo'.padRight(20)}|${'Valor'.padRight(25)}|");
  print("|${'-' * 20}|${'-' * 25}|");
  print("|${'Nombre'.padRight(20)}|${nombre.padRight(25)}|");
  print("|${'Apellido'.padRight(20)}|${apellido.padRight(25)}|");
  print("|${'Edad'.padRight(20)}|${'$edad años'.padRight(25)}|");
  print("|${'Salario'.padRight(20)}|'\$${salario.toStringAsFixed(2)}'.padRight(25)|");
  
  // Condicionales complejas en interpolación
  String mensaje = '''
¡Hola $nombre!
${edad >= 30 ? 'Eres una persona madura' : 'Eres joven'} 
y ${salario > 40000 ? 'tienes un buen salario' : 'tu salario está en desarrollo'}.
${esCasado ? 'Disfruta tu vida matrimonial' : 'Quizás encuentres a alguien especial pronto'}.
''';
  
  print("\n=== MENSAJE PERSONALIZADO ===");
  print(mensaje);
  
  // Raw strings (útil para expresiones regulares, rutas, etc.)
  String rutaArchivo = r'C:\Users\Usuario\Documents\archivo.txt';
  String regex = r'^[a-zA-Z0-9]+$';
  
  print("\n=== STRINGS RAW ===");
  print("Ruta del archivo: $rutaArchivo");
  print("Expresión regular: $regex");
  
  // Escape de caracteres especiales
  String textoConComillas = "El dijo: \"¡Hola mundo!\""; 
  String textoConSaltoLinea = "Primera línea\nSegunda línea\nTercera línea";
  
  print("\n=== CARACTERES ESPECIALES ===");
  print(textoConComillas);
  print(textoConSaltoLinea);
}
```

### Salida esperada:
```
=== PERFIL DE USUARIO ===
Nombre completo: Carlos Mendoza
Edad: 28 años
Nació en: 1996
Salario anual: $45000.50
Salario mensual: $3750.04
Estado civil: Casado

=== INFORMACIÓN ADICIONAL ===
Iniciales: C.M.
Nombre en mayúsculas: CARLOS
Apellido en minúsculas: mendoza
Longitud del nombre completo: 13 caracteres

=== HOBBIES ===
Número de hobbies: 3
Primer hobby: programación
Último hobby: ciclismo
Todos los hobbies: programación, lectura, ciclismo

=== RESUMEN COMPLETO ===
Nombre: Carlos Mendoza
Edad: 28 años (nacido en 1996)
Salario: $45000.50 anuales
Estado: Casado
Hobbies favoritos: programación y lectura
Tiempo hasta jubilación: 37 años

=== TABLA DE INFORMACIÓN ===
|Campo               |Valor                    |
|--------------------|-------------------------|
|Nombre              |Carlos                   |
|Apellido            |Mendoza                  |
|Edad                |28 años                  |
|Salario             |$45000.50                |

=== MENSAJE PERSONALIZADO ===
¡Hola Carlos!
Eres joven 
y tienes un buen salario.
Disfruta tu vida matrimonial.

=== STRINGS RAW ===
Ruta del archivo: C:\Users\Usuario\Documents\archivo.txt
Expresión regular: ^[a-zA-Z0-9]+$

=== CARACTERES ESPECIALES ===
El dijo: "¡Hola mundo!"
Primera línea
Segunda línea
Tercera línea
```

## 🧪 Ejercicios adicionales para práctica

### Ejercicio 5: Conversor de unidades

```dart
void main() {
  // Conversor de temperatura
  double celsius = 25.0;
  double fahrenheit = (celsius * 9/5) + 32;
  double kelvin = celsius + 273.15;
  
  print("=== CONVERSOR DE TEMPERATURA ===");
  print("$celsius°C = ${fahrenheit.toStringAsFixed(1)}°F");
  print("$celsius°C = ${kelvin.toStringAsFixed(1)}K");
  
  // Conversor de distancia
  double metros = 1500.0;
  double kilometros = metros / 1000;
  double millas = metros * 0.000621371;
  
  print("\n=== CONVERSOR DE DISTANCIA ===");
  print("${metros}m = ${kilometros}km");
  print("${metros}m = ${millas.toStringAsFixed(2)} millas");
}
```

### Ejercicio 6: Calculadora de IMC

```dart
void main() {
  String nombre = "Juan";
  double peso = 75.0;  // kg
  double altura = 1.80;  // metros
  
  double imc = peso / (altura * altura);
  
  String categoria = imc < 18.5 ? "Bajo peso" :
                    imc < 25.0 ? "Peso normal" :
                    imc < 30.0 ? "Sobrepeso" : "Obesidad";
  
  print("=== CALCULADORA DE IMC ===");
  print("Paciente: $nombre");
  print("Peso: ${peso}kg");
  print("Altura: ${altura}m");
  print("IMC: ${imc.toStringAsFixed(2)}");
  print("Categoría: $categoria");
  
  bool necesitaAtencion = imc < 18.5 || imc >= 30.0;
  print("Requiere atención médica: ${necesitaAtencion ? 'Sí' : 'No'}");
}
```

## ✅ Lista de verificación para el profesor

### Conceptos cubiertos:
- [ ] Declaración de variables (var, tipo explícito, final, const)
- [ ] Tipos de datos básicos (int, double, String, bool)
- [ ] Null safety (?, !, ??, ??=)
- [ ] Operadores aritméticos (+, -, *, /, ~/, %)
- [ ] Operadores de comparación (==, !=, <, >, <=, >=)
- [ ] Operadores lógicos (!, &&, ||)
- [ ] Operadores de asignación (=, +=, -=, *=, /=)
- [ ] Operador ternario (? :)
- [ ] Interpolación de strings ($ y ${})
- [ ] Comentarios (// , /* */, ///)
- [ ] Convenciones de nomenclatura

### Ejercicios verificados:
- [ ] Variables básicas funcionando
- [ ] Calculadora aritmética completa
- [ ] Operadores lógicos aplicados correctamente
- [ ] Interpolación de strings avanzada
- [ ] Manejo correcto de null safety
- [ ] Código formateado y con comentarios

## 🎓 Evaluación sugerida (100 puntos)

1. **Ejercicio práctico en clase (40 puntos)**:
   - Crear un programa que calcule el costo de un viaje
   - Incluir: distancia, consumo, precio combustible
   - Mostrar resultado formateado

2. **Quiz teórico (30 puntos)**:
   - Identificar tipos de datos
   - Evaluar expresiones lógicas
   - Corregir errores de sintaxis

3. **Proyecto mini (30 puntos)**:
   - Crear una "ficha personal" completa
   - Usar todos los tipos de datos
   - Implementar cálculos y validaciones

## 📝 Notas para el profesor

### Tiempo de clase sugerido: 4 horas
- **Introducción y variables**: 1 hora
- **Operadores**: 1 hora
- **Práctica guiada**: 1 hora
- **Ejercicios independientes**: 1 hora

### Preparación previa:
1. Tener DartPad abierto para demostraciones
2. Preparar ejemplos adicionales según el nivel del grupo
3. Revisar errores comunes de compilación
4. Tener listos ejercicios de refuerzo

### Adaptaciones por nivel:
- **Principiantes**: Enfoque en tipos básicos y operadores simples
- **Intermedios**: Incluir null safety y operadores avanzados
- **Avanzados**: Profundizar en interpolación compleja y buenas prácticas
