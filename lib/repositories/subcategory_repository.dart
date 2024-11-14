import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/subcategory.dart';

class SubCategoryRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  // Função para buscar todas as subcategorias de uma categoria específica
  Future<List<SubCategory>> fetchSubCategories(int categoryId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/categories/$categoryId/subcategories'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<SubCategory> subcategories =
          body.map((item) => SubCategory.fromJson(item)).toList();
      return subcategories;
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

  // Função para criar uma nova subcategoria
  Future<SubCategory> createSubCategory(SubCategory subCategory) async {
    final response = await http.post(
      Uri.parse('$baseUrl/subcategory/save'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(subCategory.toJson()),
    );

    if (response.statusCode == 200) {
      return SubCategory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create subcategory');
    }
  }

  // Função para deletar uma subcategoria
  Future<void> deleteSubCategory(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/subcategory/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete subcategory');
    }
  }
}
