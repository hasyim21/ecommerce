part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  success,
  error,
}

class OrderState extends Equatable {
  final OrderResponse? orderResponse;
  final List<Order> orders;
  final OrderStatus status;
  final String? error;

  const OrderState({
    this.orderResponse,
    required this.orders,
    required this.status,
    this.error,
  });

  factory OrderState.initial() {
    return const OrderState(
      orders: [],
      status: OrderStatus.initial,
    );
  }

  OrderState copyWith({
    OrderResponse? orderResponse,
    List<Order>? orders,
    OrderStatus? status,
    String? error,
  }) {
    return OrderState(
      orderResponse: orderResponse ?? this.orderResponse,
      orders: orders ?? this.orders,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [orderResponse, orders, status, error];

  @override
  String toString() {
    return 'OrderState(orderResponse: $orderResponse, orders: $orders, status: $status, error: $error)';
  }
}
