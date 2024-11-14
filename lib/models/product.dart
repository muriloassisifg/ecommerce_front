import 'subcategory.dart'; // Importa o modelo de SubCategory

class Product {
  final int id;
  final String name;
  final double price;
  final int subCategoryId; // ID da subcategoria associada
  final SubCategory
      subCategory; // Objeto SubCategory para acessar detalhes da subcategoria

  // Construtor da classe Product
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.subCategoryId,
    required this.subCategory,
  });

  // Fábrica que cria uma instância de Product a partir de um JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      subCategoryId: json['subCategoryId'],
      subCategory: SubCategory.fromJson(json['subCategory']),
    );
  }

  // Método que converte uma instância de Product para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'subCategoryId': subCategoryId,
      'subCategory': subCategory.toJson(),
    };
  }
}
