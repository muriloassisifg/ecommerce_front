import 'package:ecommerce_front/models/user.dart';

import '../repositories/user_repository_ppw3.dart'; // Importa o repositório de user

class UserService {
  final UserRepository _repository =
      UserRepository(); // Instância do repositório de subcategorias

  // Função para obter todas as subcategorias de uma categoria específica
  Future<List<User>> getUsers() {
    return _repository.fetchUsers();
  }

  // Função para adicionar uma nova subcategoria
  Future<User> addUser(User user) {
    return _repository.createUser(user);
  }

  // Função para remover uma subcategoria
  Future<void> removeUser(int id) {
    return _repository.deleteUser(id);
  }
}
