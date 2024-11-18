class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String userType;
  LoginSuccessState(this.userType);
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class DoctorRegistrationLoadingState extends AuthState {}

class DoctorRegistrationSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
