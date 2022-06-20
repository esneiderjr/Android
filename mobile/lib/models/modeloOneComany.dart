class OneCompany {
  List<OneCompani> dato = [];
  OneCompany();

  OneCompany.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new OneCompani.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class OneCompani {
  String? id;
  String? idciudad;
  String? nombreempresa;
  String? logo;
  String? nitempresa;
  String? fechacreacion;
  String? fechamodificacion;
  String? redessociales;
  String? telefonos;

  OneCompani({
    this.id,
    this.idciudad,
    this.nombreempresa,
    this.logo,
    this.nitempresa,
    this.fechacreacion,
    this.fechamodificacion,
    this.redessociales,
    this.telefonos,
  });

  OneCompani.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    idciudad = datos['idciudad'].toString();
    nombreempresa = datos['nombreempresa'].toString();
    logo = datos['logo'].toString();
    nitempresa = datos['nitempresa'].toString();
    fechacreacion = datos['fechacreacion'].toString();
    fechamodificacion = datos['fechamodificacion'].toString();
    redessociales = datos['redessociales'];
    telefonos = datos['telefonos'];

    // print(nombreempresa);
  }
}
