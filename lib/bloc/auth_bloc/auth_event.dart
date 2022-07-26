part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  SignUpEvent({required this.navigator});
  final NavigatorState navigator;
}

class SignInEvent extends AuthEvent {
  SignInEvent({required this.navigator});
  final NavigatorState navigator;
}

class OnChangePhoneEvent extends AuthEvent {
  OnChangePhoneEvent({required this.value});
  final String value;
}

class VerifyPhoneNumberEvent extends AuthEvent {
  //  OnChangePhoneEvent({required this.value});
  //  final String value;
}

class VerifyPhoneNumberForSignInEvent extends AuthEvent {
  //  OnChangePhoneEvent({required this.value});
  //  final String value;
}

class SignInWithGoogleEvent extends AuthEvent {
  SignInWithGoogleEvent({required this.navigator});
  final NavigatorState navigator;
}

class SignInWithFbEvent extends AuthEvent {
  SignInWithFbEvent({required this.navigator});
  final NavigatorState navigator;
}
