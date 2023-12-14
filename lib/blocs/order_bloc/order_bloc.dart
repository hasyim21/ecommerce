import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/order/list_order_response.dart';
import '../../data/models/order/order_request.dart';
import '../../data/models/order/order_response.dart';
import '../../data/repositories/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  OrderBloc({required this.orderRepository}) : super(OrderState.initial()) {
    on<CreateOrderEvent>((event, emit) async {
      emit(state.copyWith(status: OrderStatus.loading));
      try {
        final OrderResponse orderResponse =
            await orderRepository.createOrde(event.orderRequest);
        emit(state.copyWith(
            status: OrderStatus.success, orderResponse: orderResponse));
      } catch (e) {
        emit(state.copyWith(status: OrderStatus.error, error: e.toString()));
      }
    });

    on<GetOrdersEvent>((event, emit) async {
      emit(state.copyWith(status: OrderStatus.loading));
      try {
        final ListOrderResponse listOrders = await orderRepository.getOrders();
        emit(state.copyWith(
            status: OrderStatus.success, listOrders: listOrders));
      } catch (e) {
        emit(state.copyWith(status: OrderStatus.error, error: e.toString()));
      }
    });
  }
}
