import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/auth.dart';
import '../../data/repositories/auth_repository.dart';
import '../auth_bloc/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.authRepository, required this.authBloc})
      : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final Auth result = await authRepository.doLogin(
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
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
