part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  success,
  error,
}

class OrderState extends Equatable {
  final OrderResponse? orderResponse;
  final OrderStatus status;
  final String? error;

  const OrderState({
    this.orderResponse,
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
    OrderStatus? status,
    String? error,
  }) {
    return OrderState(
      orderResponse: orderResponse ?? this.orderResponse,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [orderResponse, status, error];

  @override
  String toString() =>
      'OrderState(orderResponse: $orderResponse, status: $status, error: $error)';
}
