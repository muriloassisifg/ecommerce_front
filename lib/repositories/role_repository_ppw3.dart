import '../models/role.dart';

class RoleRepository {
  static final List<Role> _roles = []; // Lista interna de categorias
  static int _nextId = 1; // Variável para acompanhar o próximo ID disponível

  // Simula a latência de uma chamada a um backend
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(
        Duration(milliseconds: 10)); // Simula um atraso de 10 milissegundos
  }

  // Função para buscar todas as categorias
  Future<List<Role>> fetchCategories() async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    return List.from(_roles); // Retorna uma cópia da lista de categorias
  }

  // Função para criar uma nova categoria
  Future<Role> createRole(Role role) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    role.id = _nextId++; // Atribui o próximo ID e incrementa a variável
    _roles.add(role); // Adiciona a nova categoria à lista
    return role; // Retorna a categoria criada
  }

  // Função para deletar uma categoria
  Future<void> deleteRole(int id) async {
    await _simulateNetworkDelay(); // Aguarda o atraso simulado
    _roles.removeWhere((role) => role.id == id); // Remove a categoria da lista
  }
}
