import '../models/promo.dart';
import '../services/promo_service.dart';

class PromoRepository {
  final PromoService promoService;

  PromoRepository({required this.promoService});

  Future<List<Promo>> getPromos() async {
    try {
      final List<Promo> promos = await promoService.getPromos();
      return promos;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
