import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/services/auth_service/sign_by_phone.dart';

class SignInByPhoneService extends VerifyByPhoneService {
  SignInByPhoneService() : super();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // String? _verificationCode;

  // Future<void> verifyPhoneNumber({
  //   required String phoneNumberForVerification,
  // }) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumberForVerification,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       BotToast.showText(text: e.toString());
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       _verificationCode = verificationId;
  //     },
  //     timeout: const Duration(seconds: 60),
  //     codeAutoRetrievalTimeout: (String verificationId) async {
  //       _verificationCode = verificationId;
  //     },
  //   );
  // }

  Future<void> sendCodeToFirebase({
    required NavigatorState navigator,
    required String smsCode,
  }) async {
    try {
      if (super.verificationCode != null && smsCode.length == 6) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: super.verificationCode!, smsCode: smsCode);
        await super.auth.signInWithCredential(credential);

        // if (_auth.currentUser?.emailVerified == true) {
        //   navigator.pushNamedAndRemoveUntil(
        //     AcquaintanceScreen.routeName,
        //     (_) => false,
        //   );
        //   return;
        // }
        if (super.auth.currentUser?.email == null) {
          BotToast.showText(text: registrationText);
          await super.auth.currentUser?.delete();
          navigator.pushNamedAndRemoveUntil(
            SignUpScreen.routeName,
            (_) => false,
          );
          return;
        }
        navigator.pushNamedAndRemoveUntil(
          AcquaintanceScreen.routeName,
          (_) => false,
        );
        // await _auth.signOut();
        // BotToast.showText(text: emailVerify);
      }
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  final String registrationText =
      'Чтобы пользоваться приложением, Вам \nнеобходимо зарегистрироваться';
  final String emailVerify =
      'Чтобы пользоваться приложением, Вам \nнеобходимо подтвердить адрес электронной почты';
}
