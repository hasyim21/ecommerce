import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserState.initial()) {
    on<GetUserEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));
      try {
        final User user = await userRepository.getUser();
        emit(state.copyWith(status: UserStatus.success, user: user));
      } catch (e) {
        emit(state.copyWith(status: UserStatus.error, error: e.toString()));
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));
      try {
        final User user = await userRepository.updateProfile(
          fullName: event.fullName,
          username: event.username,
          email: event.email,
          phoneNumber: event.phoneNumber,
        );
        emit(state.copyWith(status: UserStatus.success, user: user));
      } catch (e) {
        emit(state.copyWith(status: UserStatus.error, error: e.toString()));
      }
    });

    on<UpdateAddressEvent>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));
      try {
        final User user =
            await userRepository.updateAddress(address: event.address);
        emit(state.copyWith(status: UserStatus.success, user: user));
      } catch (e) {
        emit(state.copyWith(status: UserStatus.error, error: e.toString()));
      }
    });
  }
}
