# Solucionario - Instalación y configuración del entorno

## 🔧 Ejercicio 1: Instalación y verificación

### Paso 1: Instalación de Flutter SDK

#### Windows
```powershell
# Descargar Flutter SDK desde https://docs.flutter.dev/get-started/install/windows
# Extraer en C:\src\flutter

# Agregar al PATH del sistema
# Panel de Control > Sistema > Configuración avanzada > Variables de entorno
# Agregar C:\src\flutter\bin al PATH

# Verificar instalación
flutter --version
```

#### macOS
```bash
# Opción 1: Homebrew (recomendado)
brew install --cask flutter

# Opción 2: Descarga manual
# Descargar desde https://docs.flutter.dev/get-started/install/macos
# Extraer y agregar al PATH
echo 'export PATH="$PATH:[RUTA_FLUTTER]/flutter/bin"' >> ~/.zshrc
source ~/.zshrc

# Verificar
flutter --version
```

#### Linux (Ubuntu/Debian)
```bash
# Instalar dependencias
sudo apt update
sudo apt install curl git unzip xz-utils zip libglu1-mesa

# Opción 1: Snap (más fácil)
sudo snap install flutter --classic

# Opción 2: Descarga manual
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
tar xf flutter_linux_3.16.0-stable.tar.xz
echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# Verificar
flutter --version
```

### Paso 2: Verificación con Flutter Doctor
```bash
flutter doctor
```

**Resultado esperado:**
```
[✓] Flutter (Channel stable, 3.16.0, on Microsoft Windows)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio - develop Windows apps
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.84.0)
[✓] Connected device (3 available)
[✓] Network resources

• No issues found!
```

### Paso 3: Resolver problemas comunes

#### Si falta Android SDK:
```bash
# Si no tienes Android Studio, instalar command line tools
flutter doctor --android-licenses
```

#### Si falta VS Code:
```bash
# Descargar VS Code desde https://code.visualstudio.com/
# Instalar extensiones Flutter y Dart
```

## 🚀 Ejercicio 2: Primer proyecto

### Paso 1: Crear el proyecto
```bash
# Crear nuevo proyecto
flutter create mi_primera_app

# Navegar al directorio
cd mi_primera_app

# Verificar estructura creada
ls -la  # Linux/macOS
dir     # Windows
```

### Paso 2: Ejecutar la aplicación
```bash
# Ejecutar en modo debug
flutter run

# O especificar dispositivo
flutter devices  # Ver dispositivos disponibles
flutter run -d chrome  # Ejecutar en Chrome
flutter run -d windows  # Ejecutar en Windows (si está disponible)
```

### Paso 3: Modificar el contador (incremento de 2 en 2)

**Archivo:** `lib/main.dart`

**Buscar la línea:**
```dart
_counter++;
```

**Cambiar por:**
```dart
_counter += 2;
```

**Código completo modificado:**
```dart
void _incrementCounter() {
  setState(() {
    // Incrementar de 2 en 2 en lugar de 1 en 1
    _counter += 2;
  });
}
```

### Paso 4: Usar Hot Reload
1. Guardar el archivo (Ctrl+S)
2. En el terminal donde corre Flutter, presionar `r` para hot reload
3. O usar `R` para hot restart
4. Verificar que el contador ahora incremente de 2 en 2

## 📁 Ejercicio 3: Exploración del proyecto

### Estructura de carpetas creada:
```
mi_primera_app/
├── android/              # Configuración específica de Android
├── build/               # Archivos compilados (generados)
├── ios/                 # Configuración específica de iOS
├── lib/                 # Código Dart de la aplicación
│   └── main.dart       # Punto de entrada de la app
├── test/               # Tests unitarios
├── web/                # Configuración para web
├── windows/            # Configuración para Windows
├── .gitignore         # Archivos ignorados por Git
├── .metadata          # Metadatos del proyecto
├── analysis_options.yaml  # Reglas de análisis de código
├── pubspec.yaml       # Dependencias y configuración del proyecto
└── README.md          # Documentación del proyecto
```

### Archivos principales y su función:

#### 1. `lib/main.dart`
```dart
// Punto de entrada de la aplicación
// Contiene:
// - Importaciones necesarias
// - Función main() - punto de inicio
// - Clase MyApp - widget raíz
// - Clase MyHomePage - página principal
```

#### 2. `pubspec.yaml`
```yaml
# Archivo de configuración del proyecto
name: mi_primera_app        # Nombre del proyecto
description: A new Flutter project.
version: 1.0.0+1           # Versión de la app

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2   # Iconos iOS

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0     # Reglas de código

flutter:
  uses-material-design: true  # Habilita Material Design
```

#### 3. Carpetas de plataforma:
- **`android/`**: Configuración nativa de Android (Gradle, permisos, etc.)
- **`ios/`**: Configuración nativa de iOS (Xcode, Info.plist, etc.)
- **`web/`**: Archivos para compilación web (HTML, CSS, JS)
- **`windows/`**: Configuración para apps de Windows

## 🎯 Comandos útiles para el desarrollo

```bash
# Información del entorno
flutter doctor -v          # Información detallada
flutter --version         # Versión de Flutter
dart --version           # Versión de Dart

# Gestión de proyectos
flutter create <nombre>   # Crear proyecto
flutter clean            # Limpiar archivos build
flutter pub get         # Descargar dependencias
flutter pub upgrade     # Actualizar dependencias

# Ejecución y debugging
flutter run             # Ejecutar app
flutter run --release   # Ejecutar en modo release
flutter run -d <device> # Ejecutar en dispositivo específico
flutter logs           # Ver logs del dispositivo

# Testing
flutter test           # Ejecutar tests
flutter test --coverage # Tests con cobertura

# Análisis de código
flutter analyze        # Analizar código
flutter format lib/    # Formatear código

# Compilación
flutter build apk      # Build para Android
flutter build ios      # Build para iOS
flutter build web      # Build para web
```

## ✅ Criterios de evaluación

### Para el estudiante:
- [ ] Flutter doctor sin errores críticos
- [ ] Proyecto creado correctamente
- [ ] Aplicación ejecutándose
- [ ] Hot reload funcionando
- [ ] Modificación del contador implementada
- [ ] Comprensión de la estructura básica

### Para el profesor - Rúbrica:

| Criterio | Excelente (4) | Bueno (3) | Satisfactorio (2) | Necesita mejora (1) |
|----------|---------------|-----------|-------------------|--------------------|
| Instalación | Todo funciona perfectamente | Funciona con ayuda menor | Funciona con ayuda significativa | No funciona |
| Primer proyecto | Crea y modifica sin ayuda | Crea con ayuda menor | Necesita ayuda para modificar | No completa |
| Comprensión | Explica estructura claramente | Entiende conceptos básicos | Comprensión parcial | Confusión evidente |

## 🚨 Troubleshooting - Problemas frecuentes

### Error: "flutter command not found"
```bash
# Verificar PATH
echo $PATH  # Linux/macOS
echo $env:PATH  # Windows PowerShell

# Agregar Flutter al PATH temporalmente
export PATH="$PATH:/ruta/a/flutter/bin"  # Linux/macOS
$env:PATH += ";C:\src\flutter\bin"       # Windows PowerShell
```

### Error: "Android license status unknown"
```bash
flutter doctor --android-licenses
# Aceptar todas las licencias con 'y'
```

### Error: "No connected devices"
```bash
# Ver dispositivos disponibles
flutter devices

# Para usar Chrome
flutter config --enable-web
flutter run -d chrome

# Para emulador Android
flutter emulators
flutter emulators --launch <emulator_name>
```

### Hot Reload no funciona
1. Verificar que el archivo se guardó
2. Presionar `r` en el terminal
3. Si no funciona, usar `R` (hot restart)
4. Como último recurso: `Ctrl+C` y `flutter run` de nuevo

## 📝 Notas para el profesor

### Tiempo estimado de clase:
- **Instalación**: 45-60 minutos
- **Primer proyecto**: 30 minutos
- **Exploración**: 30 minutos
- **Total**: 2-2.5 horas

### Preparación previa:
1. Verificar conexión a Internet estable
2. Tener instaladores descargados
3. Preparar dispositivos de prueba
4. Revisar versiones más recientes

### Adaptaciones por plataforma:
- **Windows**: Prestar atención a variables PATH y antivirus
- **macOS**: Verificar Xcode y permisos
- **Linux**: Instalar dependencias del sistema

### Evaluación sugerida:
- Observación directa durante instalación
- Screenshot de `flutter doctor` exitoso
- Demostración del proyecto funcionando
- Breve quiz sobre estructura de proyecto
