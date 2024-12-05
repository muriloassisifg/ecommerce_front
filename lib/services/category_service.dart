import 'package:ecommerce_front/repositories/category_repository.dart';

import '../models/category.dart'; // Importa o modelo de categoria

// import '../repositories/category_repository.dart'; // Importa o repositório de categorias

// Importa os arquivos com base na condição
// Define uma variável para armazenar o repositório

class CategoryService {
  final CategoryRepository _repository =
      CategoryRepository(); // Instância do repositório de categorias

  // Função para obter todas as categorias
  Future<List<Category>> getCategories() async {
    return await _repository.fetchCategories();
  }

  // Função para adicionar uma nova categoria
  Future<Category> addCategory(Category category) async {
    return await _repository.createCategory(category);
  }

  // Função para remover uma categoria

  Future<void> removeCategory(int id) async {
    return await _repository.deleteCategory(id);
  }
}
