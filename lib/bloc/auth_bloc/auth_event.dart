part of 'auth_bloc.dart';


abstract class AuthEvent {}



class SignUpEvent extends AuthEvent {
   
 }

 class OnChangePhoneEvent extends AuthEvent {
   OnChangePhoneEvent({required this.value});
   final String value;
 }

  class VerifyPhoneNumberEvent extends AuthEvent {
  //  OnChangePhoneEvent({required this.value});
  //  final String value;
 }