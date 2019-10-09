class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map)
      : login = map["login"],
        nome = map["nome"],
        email = map["email"],
        token = map["token"],
        roles = getRoles(map);

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }

  static getRoles(Map<String, dynamic> map) {
    if (map["roles"] != null) {
      List list = map["roles"];
      List<String> roles = list.map<String>((role) => role.toString()).toList();
//    for (String role in list) {
//      roles.add(role);
//    }
      return roles;
    } else {
      return null;
    }

  }
}
