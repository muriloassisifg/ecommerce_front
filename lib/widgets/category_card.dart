import 'package:flutter/material.dart';
import '../models/category.dart';
import 'package:provider/provider.dart';
import '../controllers/category_controller.dart';

// Widget que exibe os detalhes de uma categoria em um cartão (Card)
class CategoryCard extends StatelessWidget {
  final Category category; // Categoria a ser exibida

  // Construtor que recebe uma categoria e usa o id como chave única
  CategoryCard({required this.category}) : super(key: ValueKey(category.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card que envolve o ListTile, criando um visual com bordas elevadas
      child: ListTile(
        title: Text(category.name), // Título exibindo o nome da categoria
        // Botão de deletar categoria no canto direito do cartão
        trailing: IconButton(
          icon: Icon(Icons.delete), // Ícone de lixeira
          onPressed: () {
            // Ao pressionar, chama o método de remoção do CategoryController
            Provider.of<CategoryController>(context, listen: false)
                .removeCategory(category.id);
          },
        ),
      ),
    );
  }
}
