import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';

// Widget que exibe os detalhes de um produto em um cartão (Card)
class ProductCard extends StatelessWidget {
  final Product product; // Produto a ser exibido

  // Construtor que recebe um produto e utiliza o id como chave única
  ProductCard({required this.product}) : super(key: ValueKey(product.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card que envolve o ListTile, criando um visual com bordas elevadas
      child: ListTile(
        title: Text(product.name), // Título exibindo o nome do produto
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os itens à esquerda
          children: [
            // Exibe o preço do produto, formatado com duas casas decimais
            Text('\$${product.price.toStringAsFixed(2)}'),
            SizedBox(
                height:
                    4), // Espaçamento vertical entre o preço e a subcategoria
            // Exibe o nome da subcategoria do produto
            Text(
              'Subcategoria: ${product.subCategory.name}',
              style:
                  TextStyle(color: Colors.grey[600]), // Cor cinza para o texto
            ),
            // Exibe o nome da categoria à qual a subcategoria pertence
            Text(
              'Categoria: ${product.subCategory.category.name}',
              style:
                  TextStyle(color: Colors.grey[600]), // Cor cinza para o texto
            ),
          ],
        ),
        // Botão de deletar produto no canto direito do cartão
        trailing: IconButton(
          icon: Icon(Icons.delete), // Ícone de lixeira
          onPressed: () {
            // Ao pressionar, chama o método de remoção do ProductController
            Provider.of<ProductController>(context, listen: false)
                .removeProduct(product.id);
          },
        ),
      ),
    );
  }
}
