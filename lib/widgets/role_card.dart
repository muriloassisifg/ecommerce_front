import 'package:flutter/material.dart';
import '../models/role.dart';
import 'package:provider/provider.dart';
import '../controllers/role_controller.dart';

// Widget que exibe os detalhes de uma categoria em um cartão (Card)
class RoleCard extends StatelessWidget {
  final Role role; // Categoria a ser exibida

  // Construtor que recebe uma categoria e usa o id como chave única
  RoleCard({required this.role}) : super(key: ValueKey(role.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card que envolve o ListTile, criando um visual com bordas elevadas
      child: ListTile(
        title: Text(role.name), // Título exibindo o nome da categoria
        // Botão de deletar categoria no canto direito do cartão
        trailing: IconButton(
          icon: Icon(Icons.delete), // Ícone de lixeira
          onPressed: () {
            // Ao pressionar, chama o método de remoção do RoleController
            Provider.of<RoleController>(context, listen: false)
                .removeRole(role.id);
          },
        ),
      ),
    );
  }
}
