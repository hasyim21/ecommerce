import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/product.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState.initial()) {
    on<BuyNowEvent>((event, emit) {
      emit(state.copyWith(
        status: CheckoutStatus.success,
        products: [event.product],
      ));
    });

    on<AddToCartEvent>((event, emit) {
      emit(state.copyWith(status: CheckoutStatus.loading));
      emit(state.copyWith(
        status: CheckoutStatus.success,
        products: [...state.products, event.product],
      ));
    });

    on<RemoveFromCartEvent>((event, emit) {
      final updatedProducts = List<Product>.from(state.products);
      updatedProducts.remove(event.product);

      emit(state.copyWith(status: CheckoutStatus.loading));
      emit(state.copyWith(
        status: CheckoutStatus.success,
        products: updatedProducts,
      ));
    });

    on<ClearCartEvent>((event, emit) {
      emit(state.copyWith(status: CheckoutStatus.loading));
      emit(state.copyWith(
        status: CheckoutStatus.success,
        products: [],
      ));
    });
  }
}
