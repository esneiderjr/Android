class Companys {
  List<Compani> dato = [];
  Companys();

  Companys.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Compani.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Compani {
  String? id;
  String? idciudad;
  String? nombreempresa;
  String? logo;
  String? nitempresa;
  String? fechacreacion;
  String? fechamodificacion;

  Compani({
    this.id,
    this.idciudad,
    this.nombreempresa,
    this.logo,
    this.nitempresa,
    this.fechacreacion,
    this.fechamodificacion,
  });

  Compani.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    idciudad = datos['idciudad'].toString();
    nombreempresa = datos['nombreempresa'].toString();
    logo = datos['logo'].toString();
    nitempresa = datos['nitempresa'].toString();
    fechacreacion = datos['fechacreacion'].toString();
    fechamodificacion = datos['fechamodificacion'].toString();
  }
}
