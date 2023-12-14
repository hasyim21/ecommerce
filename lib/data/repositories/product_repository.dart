import '../models/product.dart';
import '../services/product_service.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future<List<Product>> getProducts() async {
    try {
      final List<Product> products = await productService.getProducts();
      return products;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Product>> getProductsByBrand(String category) async {
    try {
      final List<Product> productsByBrand =
          await productService.getProductsByBrand(category);
      return productsByBrand;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
