import 'package:flutter/material.dart';
import 'package:usainua/services/auth_service/sign_in_by_email.dart';
import 'package:usainua/services/auth_service/sign_in_by_fb_service.dart';
import 'package:usainua/services/auth_service/sign_in_by_google_service.dart';
import 'package:usainua/services/auth_service/sign_in_by_phone_service.dart';

class AuthReposytory {
  AuthReposytory();

  final SignInByPhoneService _signInByPhoneService = SignInByPhoneService();
  final SignInByGoogleService _signInByGoogleService = SignInByGoogleService();
  final SignInByFbService _signInByFbService = SignInByFbService();
  // final SignInByEmailService _signInByEmailService = SignInByEmailService();

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    // required String emailAddress,
    // required String name,
  }) async {
    await _signInByPhoneService.verifyPhoneNumber(
      phoneNumberForVerification: phoneNumber,
      // emailAddress: emailAddress,
      // name: name,
    );
  }

  Future<void> sendCodeToFirebase({
    required BuildContext context,
    required String phoneNumber,
    required String emailAddress,
    required String name,
    String? smsCode,
    // String? name,
    // String? email,
  }) async {
    if (smsCode == null) return;
    await _signInByPhoneService.sendCodeToFirebase(
      context: context,
      smsCode: smsCode,
      emailAddress: emailAddress,
      name: name,
      phoneNumberForVerification: phoneNumber,
    );
  }

  // google auth
  Future<void> googleLogin(context) async {
    await _signInByGoogleService.googleLogin(context);
  }

  // faceBook auth
  Future<void> faceBookLogin(context) async {
    await _signInByFbService.signInWithFacebook(context);
  }
}
