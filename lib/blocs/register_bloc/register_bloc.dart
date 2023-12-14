import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/auth.dart';
import '../../data/repositories/auth_repository.dart';
import '../auth_bloc/auth_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  RegisterBloc({required this.authRepository, required this.authBloc})
      : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final Auth result = await authRepository.doRegister(
          username: event.username,
          email: event.email,
          password: event.password,
        );

        authBloc.add(LoggedIn(
          token: result.jwt,
          user: {
            'email': event.email,
            'password': event.password,
          },
        ));
        emit(RegisterInitial());
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}
