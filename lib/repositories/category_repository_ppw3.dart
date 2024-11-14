import '../models/category.dart';

class CategoryRepository {
  static final List<Category> _categories = []; // Lista interna de categorias

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(Duration(seconds: 1)); // Simula um atraso de 1 segundo
  }

  // Função para buscar todas as categorias
  Future<List<Category>> fetchCategories() async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    return List.from(_categories); // Retorna uma cópia da lista de categorias
  }

  // Função para criar uma nova categoria
  Future<Category> createCategory(Category category) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _categories.add(category); // Adiciona a nova categoria à lista
    return category; // Retorna a categoria criada
  }

  // Função para deletar uma categoria
  Future<void> deleteCategory(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _categories.removeWhere(
        (category) => category.id == id); // Remove a categoria da lista
  }
}
