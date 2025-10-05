// Async
Future<String> esperar() async {
  await Future.delayed(Duration(seconds: 2));
  return "Listo";
}

// Stream
Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) yield i;
}
