part of 'promo_bloc.dart';

enum PromoStatus {
  initial,
  loading,
  success,
  error,
}

class PromoState extends Equatable {
  final List<Promo> promos;
  final PromoStatus status;
  final String? error;

  const PromoState({
    required this.promos,
    required this.status,
    this.error,
  });

  factory PromoState.initial() {
    return const PromoState(
      promos: [],
      status: PromoStatus.initial,
    );
  }

  PromoState copyWith({
    List<Promo>? promos,
    PromoStatus? status,
    String? error,
  }) {
    return PromoState(
      promos: promos ?? this.promos,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [promos, status, error];

  @override
  String toString() =>
      'PromoState(promos: $promos, status: $status, error: $error)';
}
