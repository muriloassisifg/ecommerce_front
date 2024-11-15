import '../models/user.dart';

class UserRepository {
  final List<User> _users = [];
  int _nextId = 1; // Variável para acompanhar o próximo ID disponível

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(
        Duration(milliseconds: 10)); // Simula um atraso de 10 milisegundos
  }

  // Busca todas as subcategorias, incluindo suas categorias
  Future<List<User>> fetchUsers() async {
    return List.from(_users); // Retorna uma cópia da lista de subcategorias
  }

  // Função para criar uma nova subcategoria
  Future<User> createUser(User user) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    user.id = _nextId++; // Atribui o próximo ID e incrementa a variável
    _users.add(user);

    // Retorna a subcategoria com a categoria associada
    return User(
      id: user.id,
      userName: user.userName,
      password: user.password,
      roleId: user.roleId,
      role: user.role,
    );
  }

  // Remove uma subcategoria da lista pelo ID
  Future<void> deleteUser(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _users.removeWhere((user) => user.id == id);
  }
}
