part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class BuyNowEvent extends CheckoutEvent {
  final Product product;

  const BuyNowEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class AddToCartEvent extends CheckoutEvent {
  final Product product;

  const AddToCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveFromCartEvent extends CheckoutEvent {
  final Product product;

  const RemoveFromCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class ClearCartEvent extends CheckoutEvent {}
