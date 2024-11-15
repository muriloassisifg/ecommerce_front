import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  // Função para buscar todas as subcategorias de uma categoria específica

  Future<List<User>> fetchSubCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body.map((item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Função para criar uma nova subcategoria
  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/save'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  // Função para deletar uma subcategoria
  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/user/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
