import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await authRepository.hasToken();
      if (hasToken) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      await authRepository.saveToken(event.token);
      await authRepository.saveUser(event.user);
      emit(AuthAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthLoading());
      await authRepository.deleteToken();
      emit(AuthUnauthenticated());
    });
  }
}
