import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/role.dart';

class RoleRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  // Função para buscar todas as categorias
  Future<List<Role>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/roles'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Role> roles = body.map((item) => Role.fromJson(item)).toList();
      return roles;
    } else {
      throw Exception('Failed to load roles');
    }
  }

  // Função para criar uma nova categoria
  Future<Role> createRole(Role role) async {
    final response = await http.post(
      Uri.parse('$baseUrl/role/save'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(role.toJson()),
    );

    if (response.statusCode == 200) {
      return Role.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create role');
    }
  }

  // Função para deletar uma categoria
  Future<void> deleteRole(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/role/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete role');
    }
  }
}
