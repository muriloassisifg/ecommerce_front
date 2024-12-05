import '../models/product.dart';
import '../repositories/product_repository.dart';
// import '../repositories/product_repository_ppw3.dart';

class ProductService {
  final ProductRepository _repository = ProductRepository();

  Future<List<Product>> getProducts() async {
    return await _repository.fetchProducts();
  }

  Future<Product> addProduct(Product product) async {
    return await _repository.createProduct(product);
  }

  Future<void> removeProduct(int id) async {
    return await _repository.deleteProduct(id);
  }
}
