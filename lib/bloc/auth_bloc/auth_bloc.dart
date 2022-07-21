import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/repositorys/auth_repository.dart';
import 'package:usainua/services/auth_service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnChangePhoneEvent>(
      (event, emit) {
        state.authService.changePhoneValue(event.value);
      },
    );
    on<VerifyPhoneNumberEvent>(
      (event, emit) {
        state.authReposytory.setPhoneNumberForVerification(
            state.authService.phoneInputController.text);
        state.authReposytory.verifyPhoneNumber();
      },
    );
    on<SignUpEvent>(
      (event, emit) {
        state.authReposytory.sendCodeToFirebase(event.context);
      },
    );
    on<SignInWithGoogleEvent>(
      (event, emit) {
        state.authReposytory.googleLogin(event.context);
      },
    );
    on<SignInWithFbEvent>(
      (event, emit) {
        state.authReposytory.faceBookLogin(event.context);
      },
    );
  }
}
