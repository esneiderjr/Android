class SocialNetworks {
  List<SocialNetwork> dato = [];
  SocialNetworks();

  SocialNetworks.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new SocialNetwork.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class SocialNetwork {
  String? id;
  String? idempresa;
  String? nombrered;
  String? enlacered;

  SocialNetwork({
    this.id,
    this.idempresa,
    this.nombrered,
    this.enlacered,
  });

  SocialNetwork.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    idempresa = datos['idempresa'].toString();
    nombrered = datos['nombrered'].toString();
    enlacered = datos['enlacered'].toString();
    print('******************** ' + nombrered.toString());
  }
}
