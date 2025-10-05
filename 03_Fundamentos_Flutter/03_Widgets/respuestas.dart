// StatelessWidget
class MiTexto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hola');
  }
}

// StatefulWidget
class Contador extends StatefulWidget {
  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$valor'),
        ElevatedButton(
          onPressed: () => setState(() => valor++),
          child: Text('Sumar'),
        ),
      ],
    );
  }
}
