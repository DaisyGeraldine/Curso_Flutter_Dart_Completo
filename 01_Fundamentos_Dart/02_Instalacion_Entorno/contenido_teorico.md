# 02. Instalación y configuración del entorno

## 🎯 Objetivos de aprendizaje
Al finalizar esta lección, los estudiantes serán capaces de:
- Instalar correctamente Dart SDK y Flutter SDK
- Configurar un entorno de desarrollo profesional
- Crear y ejecutar su primer proyecto Flutter
- Verificar que la instalación funciona correctamente

## 📋 Requisitos previos
- Sistema operativo: Windows 10/11, macOS 10.14+, o Linux (Ubuntu 18.04+)
- Espacio libre en disco: mínimo 2.8 GB (sin Android Studio)
- Conexión a Internet estable
- Conocimientos básicos de línea de comandos

## 📚 Contenido teórico

### 1. Introducción a Flutter SDK
**Flutter** es el kit de desarrollo de Google que permite crear aplicaciones nativas para móvil, web y desktop desde una sola base de código.

#### Características principales:
- **Multiplataforma**: Una sola codebase para iOS, Android, Web y Desktop
- **Hot Reload**: Cambios instantáneos durante el desarrollo
- **Rendimiento nativo**: Compilación a código nativo
- **Widget-based**: Todo es un widget en Flutter

### 2. Arquitectura del entorno de desarrollo

```
Entorno de Desarrollo Flutter
├── Dart SDK (incluido en Flutter)
├── Flutter SDK
├── Editor de código (VS Code/Android Studio)
├── Emuladores/Simuladores
└── Herramientas de línea de comandos
```

### 3. Proceso de instalación

#### 3.1 Instalación de Flutter SDK

**Windows:**
1. Descargar Flutter SDK desde [flutter.dev](https://docs.flutter.dev/get-started/install)
2. Extraer en `C:\src\flutter` (evitar rutas con espacios)
3. Agregar `C:\src\flutter\bin` al PATH del sistema

**macOS:**
```bash
# Usando Homebrew (recomendado)
brew install --cask flutter

# O descarga manual
# Descargar, extraer y agregar al PATH en ~/.zshrc o ~/.bash_profile
export PATH="$PATH:`pwd`/flutter/bin"
```

**Linux:**
```bash
# Descargar y extraer
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.x.x-stable.tar.xz
tar xf flutter_linux_3.x.x-stable.tar.xz

# Agregar al PATH
export PATH="$PATH:`pwd`/flutter/bin"
```

#### 3.2 Verificación de la instalación
```bash
flutter doctor
```
Este comando diagnostica el entorno y muestra qué componentes faltan.

#### 3.3 Configuración del editor

**VS Code (Recomendado para principiantes):**
1. Instalar VS Code
2. Instalar extensiones:
   - Flutter (oficial)
   - Dart (oficial)
   - Flutter Widget Snippets
   - Awesome Flutter Snippets

**Android Studio:**
1. Descargar Android Studio
2. Instalar plugins: Flutter y Dart
3. Configurar Android SDK

### 4. Configuración adicional

#### 4.1 Para desarrollo Android
- Android Studio o Android SDK
- Configurar variables de entorno ANDROID_HOME
- Aceptar licencias: `flutter doctor --android-licenses`

#### 4.2 Para desarrollo iOS (solo macOS)
- Xcode (desde App Store)
- Command Line Tools: `xcode-select --install`
- Simulador iOS

### 5. Comandos esenciales

| Comando | Descripción |
|---------|-------------|
| `flutter doctor` | Diagnóstica el entorno |
| `flutter create <nombre>` | Crea nuevo proyecto |
| `flutter run` | Ejecuta la aplicación |
| `flutter build` | Compila para producción |
| `flutter test` | Ejecuta tests |
| `flutter clean` | Limpia archivos generados |

## 🛠️ Ejercicios prácticos

### Ejercicio 1: Instalación y verificación
1. **Instala Flutter SDK** siguiendo los pasos para tu sistema operativo
2. **Verifica la instalación** con `flutter doctor`
3. **Resuelve** todos los issues mostrados por flutter doctor
4. **Captura de pantalla** del resultado exitoso

### Ejercicio 2: Primer proyecto
1. **Crea** un nuevo proyecto: `flutter create mi_primera_app`
2. **Navega** al directorio: `cd mi_primera_app`
3. **Ejecuta** la aplicación: `flutter run`
4. **Modifica** el contador para que incremente de 2 en 2
5. **Utiliza Hot Reload** para ver los cambios

### Ejercicio 3: Exploración del proyecto
1. **Explora** la estructura de carpetas creada
2. **Identifica** los archivos principales:
   - `lib/main.dart`
   - `pubspec.yaml`
   - `android/` y `ios/` folders
3. **Documenta** qué hace cada archivo principal

## 🔍 Puntos de verificación

**Para el profesor - Lista de comprobación:**
- [ ] Flutter doctor muestra todos los componentes en verde
- [ ] El estudiante puede crear un proyecto nuevo
- [ ] La aplicación se ejecuta correctamente
- [ ] Hot Reload funciona
- [ ] El estudiante entiende la estructura básica

## 📖 Recursos adicionales
- [Documentación oficial Flutter](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Flutter Samples](https://github.com/flutter/samples)

## 🚨 Problemas comunes y soluciones

### Windows
- **Error de PATH**: Reiniciar terminal después de modificar variables
- **Antivirus**: Agregar Flutter a excepciones
- **Espacios en ruta**: Evitar rutas con espacios

### macOS
- **Permisos**: `sudo chown -R $(whoami) /usr/local/bin`
- **Xcode**: Aceptar términos y condiciones

### Linux
- **Dependencias**: `sudo apt install curl git unzip xz-utils zip libglu1-mesa`
- **Snap**: `sudo snap install flutter --classic`

## 💡 Consejos para el profesor

1. **Tiempo estimado**: 2-3 horas para instalación completa
2. **Preparación**: Tener instaladores descargados previamente
3. **Demostración**: Mostrar el proceso en vivo
4. **Troubleshooting**: Estar preparado para problemas de red/permisos
5. **Verificación**: Confirmar que cada estudiante tiene el entorno funcionando
