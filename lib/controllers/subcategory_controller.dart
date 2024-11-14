import 'package:flutter/material.dart';
import '../models/subcategory.dart';
import '../services/subcategory_service.dart'; // Importa o serviço de subcategorias

class SubCategoryController extends ChangeNotifier {
  final SubCategoryService _service =
      SubCategoryService(); // Instância do serviço de subcategorias
  List<SubCategory> _subcategories = []; // Lista local de subcategorias

  List<SubCategory> get subcategories =>
      _subcategories; // Getter para a lista de subcategorias

  // Função para carregar subcategorias de uma categoria específica
  Future<void> loadSubCategories() async {
    try {
      _subcategories = await _service
          .getSubCategories(); // Obtém as subcategorias do serviço
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error loading subcategories: $e'); // Imprime o erro no console
    }
  }

  // Função para adicionar uma nova subcategoria
  Future<void> addSubCategory(SubCategory subCategory) async {
    try {
      final addedSubCategory = await _service
          .addSubCategory(subCategory); // Adiciona a subcategoria pelo serviço
      _subcategories
          .add(addedSubCategory); // Adiciona a nova subcategoria na lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error adding subcategory: $e'); // Imprime o erro no console
    }
  }

  // Função para remover uma subcategoria
  Future<void> removeSubCategory(int id) async {
    try {
      await _service
          .removeSubCategory(id); // Remove a subcategoria pelo serviço
      _subcategories.removeWhere(
          (subCategory) => subCategory.id == id); // Remove da lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error deleting subcategory: $e'); // Imprime o erro no console
    }
  }
}
