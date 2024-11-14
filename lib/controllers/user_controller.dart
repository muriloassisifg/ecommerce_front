import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart'; // Importa o serviço de subcategorias

class UserController extends ChangeNotifier {
  final UserService _service =
      UserService(); // Instância do serviço de subcategorias
  List<User> _users = []; // Lista local de subcategorias

  List<User> get users => _users; // Getter para a lista de subcategorias

  // Função para carregar subcategorias de uma categoria específica
  Future<void> loadUsers() async {
    try {
      _users = await _service.getUsers(); // Obtém as subcategorias do serviço
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error loading users: $e'); // Imprime o erro no console
    }
  }

  // Função para adicionar uma nova subcategoria
  Future<void> addUser(User subCategory) async {
    try {
      final addedUser = await _service
          .addUser(subCategory); // Adiciona a subcategoria pelo serviço
      _users.add(addedUser); // Adiciona a nova subcategoria na lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error adding user: $e'); // Imprime o erro no console
    }
  }

  // Função para remover uma subcategoria
  Future<void> removeUser(int id) async {
    try {
      await _service.removeUser(id); // Remove a subcategoria pelo serviço
      _users.removeWhere(
          (subCategory) => subCategory.id == id); // Remove da lista local
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Error deleting user: $e'); // Imprime o erro no console
    }
  }
}
