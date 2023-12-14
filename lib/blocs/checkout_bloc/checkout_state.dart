part of 'checkout_bloc.dart';

enum CheckoutStatus {
  initial,
  loading,
  success,
  error,
}

class CheckoutState extends Equatable {
  final List<Product> products;
  final CheckoutStatus status;
  final String? error;

  const CheckoutState({
    required this.products,
    required this.status,
    this.error,
  });

  factory CheckoutState.initial() {
    return const CheckoutState(
      products: [],
      status: CheckoutStatus.initial,
    );
  }

  CheckoutState copyWith({
    List<Product>? products,
    CheckoutStatus? status,
    String? error,
  }) {
    return CheckoutState(
      products: products ?? this.products,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [products, status, error];

  @override
  String toString() =>
      'CheckoutState(products: $products, status: $status, error: $error)';
}
