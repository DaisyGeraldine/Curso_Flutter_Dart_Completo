// Widget personalizado
class TarjetaInfo extends StatelessWidget {
  final String titulo;
  TarjetaInfo(this.titulo);
  @override
  Widget build(BuildContext context) => Card(child: Text(titulo));
}
