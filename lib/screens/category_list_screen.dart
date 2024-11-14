import 'package:ecommerce_front/controllers/category_controller.dart';
import 'package:ecommerce_front/screens/add_category_popup.dart';
import 'package:ecommerce_front/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém o controlador de categorias usando o Provider
    final controller = Provider.of<CategoryController>(context, listen: false);
    // Carrega a lista de categorias ao construir a tela
    controller.loadCategories();

    return Stack(
      children: [
        // Escuta mudanças no controlador de categorias
        Consumer<CategoryController>(
          builder: (context, controller, child) {
            // Exibe uma mensagem centralizada se a lista de categorias estiver vazia
            if (controller.categories.isEmpty) {
              return const Center(child: Text("Nenhuma categoria cadastrada"));
            }
            // Caso contrário, exibe uma ListView das categorias
            return ListView.builder(
              itemCount:
                  controller.categories.length, // Número de categorias na lista
              itemBuilder: (context, index) {
                return CategoryCard(
                    category: controller.categories[
                        index]); // Exibe cada categoria usando CategoryCard
              },
            );
          },
        ),
        // Botão flutuante adicionado ao Stack
        Positioned(
          bottom: 16, // Distância da parte inferior da tela
          right: 16, // Distância do lado direito da tela
          child: FloatingActionButton(
            onPressed: () {
              // Exibe o pop-up de adicionar categoria ao pressionar o botão
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddCategoryPopup(); // Widget responsável por adicionar novas categorias
                },
              );
            },
            child: Icon(Icons.add), // Ícone '+' para adicionar categorias
            backgroundColor:
                Colors.blue, // Define a cor de fundo do botão como azul
          ),
        ),
      ],
    );
  }
}
