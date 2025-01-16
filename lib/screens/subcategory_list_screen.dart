import 'package:ecommerce_front/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/subcategory_controller.dart'; // Importa o controlador de subcategorias
import '../widgets/subcategory_card.dart'; // Importa o widget SubCategoryCard
import 'add_subcategory_popup.dart'; // Importa a tela de pop-up para adicionar novas subcategorias

class SubCategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém o controlador de subcategorias usando o Provider
    final controller =
        Provider.of<SubCategoryController>(context, listen: false);
    // Carrega a lista de categorias ao construir a tela
    controller.loadSubCategories();

    Provider.of<CategoryController>(context, listen: false).loadCategories();

    return Stack(
      children: [
        Consumer<SubCategoryController>(
          builder: (context, controller, child) {
            if (controller.subcategories.isEmpty) {
              return const Center(
                  child: Text("Nenhuma subcategoria cadastrada"));
            }
            return ListView.builder(
              itemCount: controller.subcategories.length,
              itemBuilder: (context, index) {
                return SubCategoryCard(
                    subCategory: controller.subcategories[
                        index]); // Exibe cada subcategoria usando SubCategoryCard
              },
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddSubCategoryPopup(); // Widget responsável por adicionar novas subcategorias
                },
              );
            },
            child: Icon(Icons.add),
            backgroundColor:
                Colors.orange, // Define a cor de fundo do botão como laranja
          ),
        ),
      ],
    );
  }
}
