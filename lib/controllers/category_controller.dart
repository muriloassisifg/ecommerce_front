import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/category_service.dart'; // Importa o serviço de categorias

class CategoryController extends ChangeNotifier {
  final CategoryService _service =
      CategoryService(); // Instância do serviço de categorias
  List<Category> _categories = []; // Lista local de categorias

  List<Category> get categories =>
      _categories; // Getter para a lista de categorias

  // Função para carregar as categorias
  Future<void> loadCategories() async {
    try {
      _categories =
          await _service.getCategories(); // Obtém as categorias do serviço
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error loading categories: $e'); // Imprime o erro no console
    }
  }

  // Função para adicionar uma nova categoria
  Future<void> addCategory(Category category) async {
    try {
      final addedCategory = await _service
          .addCategory(category); // Adiciona a categoria pelo serviço
      _categories
          .add(addedCategory); // Adiciona a nova categoria na lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error adding category: $e'); // Imprime o erro no console
    }
  }

  // Função para remover uma categoria
  Future<void> removeCategory(int id) async {
    try {
      await _service.removeCategory(id); // Remove a categoria pelo serviço
      _categories.removeWhere(
          (category) => category.id == id); // Remove da lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error deleting category: $e'); // Imprime o erro no console
    }
  }
}
