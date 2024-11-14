import 'package:flutter/material.dart';
import '../models/role.dart';
import '../services/role_service.dart'; // Importa o serviço de categorias

class RoleController extends ChangeNotifier {
  final RoleService _service =
      RoleService(); // Instância do serviço de categorias
  List<Role> _roles = []; // Lista local de categorias

  List<Role> get roles => _roles; // Getter para a lista de categorias

  // Função para carregar as categorias
  Future<void> loadCategories() async {
    try {
      _roles = await _service.getRoles(); // Obtém as categorias do serviço
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error loading roles: $e'); // Imprime o erro no console
    }
  }

  // Função para adicionar uma nova categoria
  Future<void> addRole(Role role) async {
    try {
      final addedRole =
          await _service.addRole(role); // Adiciona a categoria pelo serviço
      _roles.add(addedRole); // Adiciona a nova categoria na lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error adding role: $e'); // Imprime o erro no console
    }
  }

  // Função para remover uma categoria
  Future<void> removeRole(int id) async {
    try {
      await _service.removeRole(id); // Remove a categoria pelo serviço
      _roles.removeWhere((role) => role.id == id); // Remove da lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error deleting role: $e'); // Imprime o erro no console
    }
  }
}
