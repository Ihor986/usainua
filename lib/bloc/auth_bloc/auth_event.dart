part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  SignUpEvent({required this.context});
  final BuildContext context;
}

class OnChangePhoneEvent extends AuthEvent {
  OnChangePhoneEvent({required this.value});
  final String value;
}

class VerifyPhoneNumberEvent extends AuthEvent {
  //  OnChangePhoneEvent({required this.value});
  //  final String value;
}

class SignInWithGoogleEvent extends AuthEvent {
  SignInWithGoogleEvent({required this.context});
  final BuildContext context;
}

class SignInWithFbEvent extends AuthEvent {
  SignInWithFbEvent({required this.context});
  final BuildContext context;
}
