# Ejemplo: Uso de paquete http

Para instalar el paquete http, agrega en tu pubspec.yaml:

```yaml
dependencies:
  http: ^1.1.0
```

Luego ejecuta:
```
flutter pub get
```

## Ejemplo de código

```dart
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print('Respuesta: ${response.body}');
  } else {
    print('Error: ${response.statusCode}');
  }
}
```

Este ejemplo realiza una petición GET y muestra la respuesta en consola.
