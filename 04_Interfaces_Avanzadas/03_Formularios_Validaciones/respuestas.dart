// Formulario y validación
Form(
  child: TextFormField(
    validator: (v) => v!.contains('@') ? null : 'Email inválido',
  ),
)
