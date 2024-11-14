import '../models/role.dart'; // Importa o modelo de categoria
import 'package:ecommerce_front/repositories/role_repository_ppw3.dart';

// Importa os arquivos com base na condição
// Define uma variável para armazenar o repositório

class RoleService {
  final RoleRepository _repository =
      RoleRepository(); // Instância do repositório de categorias

  // Função para obter todas as categorias
  Future<List<Role>> getRoles() {
    return _repository.fetchCategories();
  }

  // Função para adicionar uma nova categoria
  Future<Role> addRole(Role role) {
    return _repository.createRole(role);
  }

  // Função para remover uma categoria
  Future<void> removeRole(int id) {
    return _repository.deleteRole(id);
  }
}
