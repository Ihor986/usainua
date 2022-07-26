import 'package:flutter/material.dart';
// import 'package:usainua/services/auth_service/sign_in_by_email.dart';
import 'package:usainua/services/auth_service/sign_in_by_fb_service.dart';
import 'package:usainua/services/auth_service/sign_in_by_google_service.dart';
import 'package:usainua/services/auth_service/sign_in_by_phone_service.dart';
import 'package:usainua/services/auth_service/sign_up_by_phone_service.dart';

class AuthReposytory {
  AuthReposytory();

  final SignUpByPhoneService _signUpByPhoneService = SignUpByPhoneService();
  final SignInByGoogleService _signInByGoogleService = SignInByGoogleService();
  final SignInByFbService _signInByFbService = SignInByFbService();
  final SignInByPhoneService _signInByPhoneService = SignInByPhoneService();
  // final SignInByEmailService _signInByEmailService = SignInByEmailService();

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
  }) async {
    await _signUpByPhoneService.verifyPhoneNumber(
      phoneNumberForVerification: phoneNumber,
    );
  }

  Future<void> sendCodeToFirebase({
    required NavigatorState navigator,
    required String phoneNumber,
    required String emailAddress,
    required String name,
    String? smsCode,
  }) async {
    if (smsCode == null) return;
    await _signUpByPhoneService.sendCodeToFirebase(
      navigator: navigator,
      smsCode: smsCode,
      emailAddress: emailAddress,
      name: name,
      phoneNumberForVerification: phoneNumber,
    );
  }

  // google auth
  Future<void> googleLogin(NavigatorState navigator) async {
    await _signInByGoogleService.googleLogin(navigator);
  }

  // faceBook auth
  Future<void> faceBookLogin(NavigatorState navigator) async {
    await _signInByFbService.signInWithFacebook(navigator);
  }

  Future<void> verifyPhoneNumberForSignIn({
    required String phoneNumber,
  }) async {
    await _signInByPhoneService.verifyPhoneNumber(
      phoneNumberForVerification: phoneNumber,
    );
  }

  Future<void> sendCodeToFirebaseForSignIn({
    required NavigatorState navigator,
    String? smsCode,
  }) async {
    if (smsCode == null) return;
    await _signInByPhoneService.sendCodeToFirebase(
      navigator: navigator,
      smsCode: smsCode,
    );
  }
}
