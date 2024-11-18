import 'package:bookia_2/core/services/local/local_storage.dart';
import 'package:bookia_2/feature/auth/data/models/user_model_response/user_model_response.dart';
import 'package:bookia_2/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  UserModelResponse? userModelResponse;

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    // login logic
    emit(LoginLoadingState());
    await AuthRepo.login(email: event.email, password: event.password)
        .then((value) {
      if (value != null) {
        userModelResponse = value;
        AppLocalStorage.cacheData('token', value.data?.token ?? '');
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState());
      }
    });
  }

  Future register(RegisterEvent event, Emitter<AuthState> emit) async {
    // register logic
    emit(RegisterLoadingState());
    await AuthRepo.register(
            name: event.name,
            email: event.email,
            password: event.password,
            passwordConfirmation: event.password_confirmation)
        .then((value) {
      if (value != null) {
        userModelResponse = value;
        AppLocalStorage.cacheData('token', value.data?.token ?? '');
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState());
      }
    });
  }
}
