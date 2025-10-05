// API y JSON
// Ver ejemplo_http.md para uso de paquete http

// Decodificar JSON
import 'dart:convert';
String jsonStr = '{"nombre": "Ana", "edad": 20}';
var data = jsonDecode(jsonStr);
print(data['nombre']);
