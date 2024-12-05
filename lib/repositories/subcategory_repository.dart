import 'dart:convert';
import 'package:ecommerce_front/main.dart';
import 'package:ecommerce_front/screens/login_screen.dart';
import 'package:ecommerce_front/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/subcategory.dart';

class SubCategoryRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  /// Método para obter os cabeçalhos de autenticação
  Future<Map<String, String>> _getHeaders() async {
    final token = AppStorage.instance.token;
    if (token != null) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    }
    return {"Content-Type": "application/json"};
  }

  /// Método genérico para tratar o erro 401
  void _handleUnauthorized() {
    AppStorage.instance.removeToken(); // Remove o token inválido
    MyApp.navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<List<SubCategory>> fetchSubCategories() async {
    final headers = await _getHeaders();
    final response =
        await http.get(Uri.parse('$baseUrl/subcategories'), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => SubCategory.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      _handleUnauthorized(); // Trata o erro 401
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

  Future<SubCategory> createSubCategory(SubCategory subCategory) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/subcategory/save'),
      headers: headers,
      body: jsonEncode(subCategory.toJson()),
    );

    if (response.statusCode == 200) {
      return SubCategory.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      _handleUnauthorized(); // Trata o erro 401
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to create subcategory');
    }
  }

  Future<void> deleteSubCategory(int id) async {
    final headers = await _getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/subcategory/$id'),
      headers: headers,
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        _handleUnauthorized(); // Trata o erro 401
        throw Exception('Unauthorized');
      }
      throw Exception('Failed to delete subcategory');
    }
  }
}
