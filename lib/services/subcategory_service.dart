import '../models/subcategory.dart'; // Importa o modelo de subcategoria
import '../repositories/subcategory_repository.dart'; // Importa o repositório de subcategorias
// import '../repositories/subcategory_repository_ppw3.dart'; // Importa o repositório de subcategorias

class SubCategoryService {
  final SubCategoryRepository _repository =
      SubCategoryRepository(); // Instância do repositório de subcategorias

  // Função para obter todas as subcategorias de uma categoria específica
  Future<List<SubCategory>> getSubCategories() async {
    return await _repository.fetchSubCategories();
  }

  // Função para adicionar uma nova subcategoria
  Future<SubCategory> addSubCategory(SubCategory subCategory) async {
    return await _repository.createSubCategory(subCategory);
  }

  // Função para remover uma subcategoria
  Future<void> removeSubCategory(int id) async {
    return await _repository.deleteSubCategory(id);
  }
}
