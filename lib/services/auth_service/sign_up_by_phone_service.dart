import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:usainua/models/user.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/services/auth_service/sign_by_phone.dart';
import 'package:usainua/services/toast_bot_servise.dart';

class SignUpByPhoneService extends VerifyByPhoneService {
  SignUpByPhoneService() : super();

  Future<void> sendCodeToFirebase({
    required NavigatorState navigator,
    required String smsCode,
    required String emailAddress,
    required String name,
    required String phoneNumberForVerification,
  }) async {
    try {
      if (super.verificationCode != null && smsCode.length == 6) {
        await _createUser(
          navigator: navigator,
          emailAddress: emailAddress,
          password: phoneNumberForVerification + name,
        );

        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: super.verificationCode!,
          smsCode: smsCode,
        );
        if (super.auth.currentUser == null) return;
        await super.auth.currentUser!.updatePhoneNumber(credential);
        await _createUserData(
          navigator: navigator,
          emailAddress: super.auth.currentUser!.email,
          name: name,
          password: phoneNumberForVerification + name,
          phone: phoneNumberForVerification,
        );
        navigator.pushNamedAndRemoveUntil(
          AcquaintanceScreen.routeName,
          (_) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      BotToast.showText(text: e.message.toString());
      navigator.pushNamedAndRemoveUntil(
        SignUpScreen.routeName,
        (_) => false,
      );
    } catch (e) {
      navigator.pushNamedAndRemoveUntil(
        SignUpScreen.routeName,
        (_) => false,
      );
      ToastBot.showText(text: e.toString());
    }
  }

  Future<void> _createUser({
    required NavigatorState navigator,
    required String emailAddress,
    required String password,
  }) async {
    try {
      await super.auth.createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      await super.auth.setLanguageCode('ru');
      await super.auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      navigator.pushNamedAndRemoveUntil(
        SignUpScreen.routeName,
        (_) => false,
      );
      ToastBot.showText(text: e.message.toString());
    } catch (e) {
      // print(e);
      ToastBot.showText(text: e.toString());
    }
  }

  Future<void> _createUserData({
    required NavigatorState navigator,
    required String? emailAddress,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      LocalUser user = LocalUser(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: emailAddress,
        phoneNumber: phone,
        name: name,
        password: password,
        balance: 0,
        isEmailVerify: super.auth.currentUser?.emailVerified,
      );
      await FirebaseFirestore.instance
          .collection(emailAddress ?? phone)
          .doc('authUser')
          .set(user.toMap());
    } catch (e) {
      navigator.pushNamedAndRemoveUntil(
        SignUpScreen.routeName,
        (_) => false,
      );
      ToastBot.showText(text: e.toString());
      // print(e);
    }
  }
}
