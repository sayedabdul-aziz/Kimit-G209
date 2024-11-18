import 'package:se7ety/core/enums/user_type_enum.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final UserType userType;

  RegisterEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.userType});
}

class ConfirmDoctorRegistrationEvent extends AuthEvent {
  final DoctorModel doctorModel;
  ConfirmDoctorRegistrationEvent({required this.doctorModel});
}
