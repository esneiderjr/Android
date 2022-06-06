class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Usuario {
  String? id;
  String? email;
  String? userName;
  // String? fullName;
  String? token;

  Usuario({
    this.id,
    this.email,
    this.userName,
    // this.fullName,
    this.token,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    email = datos['email'];
    userName = datos['userName'];
    // fullName = datos['fullName'];
    token = datos['token'];
  }
}
