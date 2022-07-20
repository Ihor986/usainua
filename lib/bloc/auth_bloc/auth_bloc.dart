import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/repositorys/auth_repositury.dart';
// import 'package:meta/meta.dart';
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
        state.authReposytory.sendCodeToFirebase();
      },
    );
    on<SignInWithGoogleEvent>(
      (event, emit) {
        print('SignInWithGoogleEvent');
        state.authReposytory.googleLogin();
      },
    );
  }
}
