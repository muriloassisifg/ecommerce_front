import 'package:ecommerce_front/models/role.dart';

class User {
  int id;
  String name;
  int roleId; // ID da categoria à qual a subcategoria pertence
  Role role; // Objeto Role para acessar informações da categoria

  // Construtor da classe User
  User({
    required this.id,
    required this.name,
    required this.roleId,
    required this.role,
  });

  // Fábrica que cria uma instância de User a partir de um JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      roleId: json['role_id'],
      role: Role.fromJson(json['role']),
    );
  }

  // Método que converte uma instância de User para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role_id': roleId,
    };
  }
}
