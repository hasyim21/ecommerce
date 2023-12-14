import '../models/brand.dart';
import '../services/brand_service.dart';

class BrandRepository {
  final BrandService brandService;

  BrandRepository({
    required this.brandService,
  });

  Future<List<Brand>> getBrands() async {
    try {
      final List<Brand> brands = await brandService.getBrands();
      return brands;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
