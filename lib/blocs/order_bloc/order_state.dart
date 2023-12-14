part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  success,
  error,
}

class OrderState extends Equatable {
  final OrderResponse? orderResponse;
  final ListOrderResponse? listOrders;
  final OrderStatus status;
  final String? error;

  const OrderState({
    this.orderResponse,
    this.listOrders,
    required this.status,
    this.error,
  });

  factory OrderState.initial() {
    return const OrderState(
      status: OrderStatus.initial,
    );
  }

  OrderState copyWith({
    OrderResponse? orderResponse,
    ListOrderResponse? listOrders,
    OrderStatus? status,
    String? error,
  }) {
    return OrderState(
      orderResponse: orderResponse ?? this.orderResponse,
      listOrders: listOrders ?? this.listOrders,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [orderResponse, listOrders, status, error];

  @override
  String toString() {
    return 'OrderState(orderResponse: $orderResponse, listOrders: $listOrders, status: $status, error: $error)';
  }
}
