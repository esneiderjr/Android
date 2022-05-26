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
  String? rp;
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? idAdmin;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  String? externalId;
  String? externalAuth;
  String? roleId;

  Usuario({
    this.rp,
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.idAdmin,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.externalId,
    this.externalAuth,
    this.roleId,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    name = datos['name'];
    email = datos['email'];
    emailVerifiedAt = datos['email_verified_at'];
    idAdmin = datos['idAdmin'];
    password = datos['password'];
    rememberToken = datos['remember_token'];
    createdAt = datos['created_at'];
    updatedAt = datos['updated_at'];
    avatar = datos['avatar'];
    externalId = datos['external_id'];
    externalAuth = datos['external_auth'];
    roleId = datos['role_id'];
  }
}
