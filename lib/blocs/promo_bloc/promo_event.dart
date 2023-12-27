part of 'promo_bloc.dart';

abstract class PromoEvent extends Equatable {
  const PromoEvent();

  @override
  List<Object> get props => [];
}

class GetPromosEvent extends PromoEvent {}
