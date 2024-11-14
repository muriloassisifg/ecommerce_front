import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  // Função para buscar todas as categorias
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Category> categories =
          body.map((item) => Category.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Função para criar uma nova categoria
  Future<Category> createCategory(Category category) async {
    final response = await http.post(
      Uri.parse('$baseUrl/category/save'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create category');
    }
  }

  // Função para deletar uma categoria
  Future<void> deleteCategory(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/category/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category');
    }
  }
}
