part of 'brand_bloc.dart';

enum BrandStatus {
  initial,
  loading,
  success,
  error,
}

class BrandState extends Equatable {
  final List<Brand> brands;
  final BrandStatus status;
  final String? error;

  const BrandState({
    required this.brands,
    required this.status,
    this.error,
  });

  factory BrandState.initial() {
    return const BrandState(
      brands: [],
      status: BrandStatus.initial,
    );
  }

  BrandState copyWith({
    List<Brand>? brands,
    BrandStatus? status,
    String? error,
  }) {
    return BrandState(
      brands: brands ?? this.brands,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [brands, status, error];

  @override
  String toString() =>
      'BrandState(brands: $brands, status: $status, error: $error)';
}
