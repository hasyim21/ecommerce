part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends OrderEvent {
  final OrderRequest orderRequest;

  const CreateOrderEvent({required this.orderRequest});

  @override
  List<Object> get props => [orderRequest];
}

class GetOrdersEvent extends OrderEvent {}
