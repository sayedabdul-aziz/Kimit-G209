import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/enums/user_type_enum.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<ConfirmDoctorRegistrationEvent>(updateDoctorData);
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      AppLocalStorage.cacheData(
          key: AppLocalStorage.userType,
          value: credential.user?.photoURL ?? '');
      emit(LoginSuccessState(credential.user?.photoURL ?? ''));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user;
      if (credential.user != null) {
        user = credential.user!;
        user.updateDisplayName(event.name);
        // use photoURL as user role
        user.updatePhotoURL(event.userType.toString());
      }
      if (event.userType == UserType.doctor) {
        FirebaseFirestore.instance.collection('doctors').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
        });
      } else {
        FirebaseFirestore.instance.collection('patients').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'age': '',
          'email': event.email,
          'phone': '',
          'bio': '',
          'city': '',
          'uid': user?.uid,
        });
      }
      AppLocalStorage.cacheData(
          key: AppLocalStorage.userType, value: event.userType.toString());
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة السر ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('البريد الالكتروني مستخدم بالفعل'));
      } else {
        emit(AuthErrorState('حدث خطأ ما'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما'));
    }
  }

  updateDoctorData(
      ConfirmDoctorRegistrationEvent event, Emitter<AuthState> emit) async {
    emit(DoctorRegistrationLoadingState());

    try {
      FirebaseFirestore.instance
          .collection("doctors")
          .doc(event.doctorModel.uid)
          .update(event.doctorModel.toJson());

      emit(DoctorRegistrationSuccessState());
    } on Exception catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
