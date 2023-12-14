part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductEvent {}

class GetProductsByBrandEvent extends ProductEvent {
  final String category;

  const GetProductsByBrandEvent({required this.category});

  @override
  List<Object> get props => [category];
}
