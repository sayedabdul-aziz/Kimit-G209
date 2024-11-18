class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  RegisterEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.password_confirmation});
}
