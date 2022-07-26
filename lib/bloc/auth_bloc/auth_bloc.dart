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
        // state.authService.dispouseCode();
        state.authReposytory.verifyPhoneNumber(
          phoneNumber: state.authService.phoneInputController.text,
        );
      },
    );

    on<SignUpEvent>(
      (event, emit) {
        state.authReposytory.sendCodeToFirebase(
          navigator: event.navigator,
          smsCode: state.authService.getCode,
          phoneNumber: state.authService.phoneInputController.text,
          emailAddress: state.authService.emailInputController.text,
          name: state.authService.nameInputController.text,
        );
      },
    );

    on<VerifyPhoneNumberForSignInEvent>(
      (event, emit) {
        // state.authService.dispouseCode();
        state.authReposytory.verifyPhoneNumberForSignIn(
          phoneNumber: state.authService.phoneInputController.text,
        );
      },
    );

    on<SignInEvent>(
      (event, emit) {
        print('bloc');
        state.authReposytory.sendCodeToFirebaseForSignIn(
          navigator: event.navigator,
          smsCode: state.authService.getCode,
        );
      },
    );

    on<SignInWithGoogleEvent>(
      (event, emit) {
        state.authReposytory.googleLogin(event.navigator);
      },
    );
    on<SignInWithFbEvent>(
      (event, emit) {
        state.authReposytory.faceBookLogin(event.navigator);
      },
    );
  }
}
