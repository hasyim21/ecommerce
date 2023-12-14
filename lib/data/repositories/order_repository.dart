import '../models/auth.dart';
import '../models/order/list_order_response.dart';
import '../models/order/order_request.dart';
import '../models/order/order_response.dart';
import '../services/db_service.dart';
import '../services/order_service.dart';

class OrderRepository {
  final OrderService orderService;
  final DBService dbService;

  OrderRepository({
    required this.orderService,
    required this.dbService,
  });

  Future<OrderResponse> createOrde(OrderRequest orderRequest) async {
    try {
      final String token = await dbService.getToken();
      final OrderResponse order =
          await orderService.createOrder(orderRequest, token);
      return order;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<ListOrderResponse> getOrders() async {
    try {
      final Auth authData = await dbService.getAuthData();
      final int userId = authData.user.id;
      final String token = await dbService.getToken();
      final ListOrderResponse order =
          await orderService.getOrders(userId, token);
      return order;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
