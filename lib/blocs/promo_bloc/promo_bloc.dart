import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/promo.dart';
import '../../data/repositories/promo_repository.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final PromoRepository promoRepository;
  PromoBloc({required this.promoRepository}) : super(PromoState.initial()) {
    on<GetPromosEvent>((event, emit) async {
      emit(state.copyWith(status: PromoStatus.loading));
      try {
        final List<Promo> promos = await promoRepository.getPromos();
        emit(state.copyWith(status: PromoStatus.success, promos: promos));
      } catch (e) {
        emit(state.copyWith(status: PromoStatus.error, error: e.toString()));
      }
    });
  }
}
