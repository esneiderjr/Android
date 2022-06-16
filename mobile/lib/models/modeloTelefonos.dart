class Telefonos {
  List<Telefono>dato = [];
  Telefonos();

  Telefonos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Telefono.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Telefono {
  String? id;
  String? tiponumero;
  String? numerotelefono;
  String? indicativo;

  Telefono({
    this.id,
    this.tiponumero,
    this.numerotelefono,
    this.indicativo,
  });

  Telefono.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    tiponumero = datos['tiponumero'].toString();
    numerotelefono = datos['numerotelefono'].toString();
    indicativo = datos['indicativo'].toString();
    // print('******************** ' + indicativo.toString());
  }
}
