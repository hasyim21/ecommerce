import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/brand.dart';
import '../../data/repositories/brand_repository.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository brandRepository;

  BrandBloc({required this.brandRepository}) : super(BrandState.initial()) {
    on<GetBrandsEvent>((event, emit) async {
      emit(state.copyWith(status: BrandStatus.loading));
      try {
        final List<Brand> brands = await brandRepository.getBrands();
        emit(state.copyWith(status: BrandStatus.success, brands: brands));
      } catch (e) {
        emit(state.copyWith(status: BrandStatus.error, error: e.toString()));
      }
    });
  }
}
