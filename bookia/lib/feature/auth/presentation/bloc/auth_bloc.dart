import 'package:bookia/feature/auth/data/models/user_model_response/user_model_response.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  UserModelResponse? userModelResponse;

  login(LoginEvent event, Emitter<AuthState> emit) {
    // login logic
    emit(LoginLoadingState());
  }

  Future register(RegisterEvent event, Emitter<AuthState> emit) async {
    // register logic
    emit(RegisterLoadingState());
    await AuthRepo.register(
            name: event.name,
            email: event.email,
            password: event.password,
            password_confirmation: event.password_confirmation)
        .then((value) {
      if (value != null) {
        userModelResponse = value;

        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState());
      }
    });
  }
}
