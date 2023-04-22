class Medicamentos {
  int id;
  String nombre;
  String marca;
  double precio;
  String principioactivo;
  String fecha;
  String proveedor;

  Medicamentos(
      {this.id = 0,
      required this.nombre,
      required this.marca,
      required this.precio,
      required this.principioactivo,
      required this.fecha,
      required this.proveedor});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'marca': marca,
      'precio': precio,
      'principioactivo': principioactivo,
      'fecha': fecha,
      'proveedor': proveedor
    };
  }
}
