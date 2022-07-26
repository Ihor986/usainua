import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:usainua/models/user.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignUpByPhoneService {
  SignUpByPhoneService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationCode;

  Future<void> verifyPhoneNumber({
    required String phoneNumberForVerification,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerification,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        BotToast.showText(text: e.toString());
      },
      codeSent: (String verificationId, int? resendToken) async {
        _verificationCode = verificationId;
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) async {
        _verificationCode = verificationId;
      },
    );
  }

  Future<void> sendCodeToFirebase({
    required NavigatorState navigator,
    required String smsCode,
    required String emailAddress,
    required String name,
    required String phoneNumberForVerification,
  }) async {
    try {
      if (_verificationCode != null && smsCode.length == 6) {
        await _createUser(
          emailAddress: emailAddress,
          password: phoneNumberForVerification + name,
        );

        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationCode!,
          smsCode: smsCode,
        );
        if (_auth.currentUser == null) return;
        await _auth.currentUser!.updatePhoneNumber(credential);
        _createUserData(
          emailAddress: emailAddress,
          name: name,
          password: phoneNumberForVerification + name,
          phone: phoneNumberForVerification,
        );
        navigator.pushNamedAndRemoveUntil(
          AcquaintanceScreen.routeName,
          (_) => false,
        );
      }
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  Future<void> _createUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await _auth.setLanguageCode('ru');
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  Future<void> _createUserData({
    required String emailAddress,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      UserAuth user = UserAuth(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: emailAddress,
        phoneNumber: phone,
        name: name,
        password: password,
        isEmailVerify: _auth.currentUser?.emailVerified,
      );
      await FirebaseFirestore.instance
          .collection(emailAddress)
          .doc('authUser')
          .set(user.toMap());
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }
}
