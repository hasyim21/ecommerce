import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({
    required this.productRepository,
  }) : super(ProductState.initial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));
      try {
        final List<Product> products = await productRepository.getProducts();
        emit(state.copyWith(status: ProductStatus.success, products: products));
      } catch (e) {
        emit(state.copyWith(status: ProductStatus.error, error: e.toString()));
      }
    });

    on<GetProductsByBrandEvent>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));
      try {
        final List<Product> productsByBrand =
            await productRepository.getProductsByBrand(event.category);
        emit(state.copyWith(
            status: ProductStatus.success, productsByBrand: productsByBrand));
      } catch (e) {
        emit(state.copyWith(status: ProductStatus.error, error: e.toString()));
      }
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));
      try {
        final List<Product> searchProducts =
            await productRepository.searchProducts(event.name);
        emit(state.copyWith(
            status: ProductStatus.success, searchProducts: searchProducts));
      } catch (e) {
        emit(state.copyWith(status: ProductStatus.error, error: e.toString()));
      }
    });

    on<ClearSearchProductsEvent>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.initial));
    });
  }
}
