part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  error,
}

class ProductState extends Equatable {
  final List<Product> products;
  final List<Product> productsByBrand;
  final List<Product> searchProducts;
  final ProductStatus status;
  final String? error;

  const ProductState({
    required this.products,
    required this.productsByBrand,
    required this.searchProducts,
    required this.status,
    this.error,
  });

  factory ProductState.initial() {
    return const ProductState(
      products: [],
      productsByBrand: [],
      searchProducts: [],
      status: ProductStatus.initial,
    );
  }

  ProductState copyWith({
    List<Product>? products,
    List<Product>? productsByBrand,
    List<Product>? searchProducts,
    ProductStatus? status,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      productsByBrand: productsByBrand ?? this.productsByBrand,
      searchProducts: searchProducts ?? this.searchProducts,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      products,
      productsByBrand,
      searchProducts,
      status,
      error,
    ];
  }

  @override
  String toString() {
    return 'ProductState(products: $products, productsByBrand: $productsByBrand, searchProducts: $searchProducts, status: $status, error: $error)';
  }
}
