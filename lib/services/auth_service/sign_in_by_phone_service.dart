import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignInByPhoneService {
  SignInByPhoneService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationCode;

  Future<void> verifyPhoneNumber({
    required String phoneNumberForVerification,
    // required String emailAddress,
    // required String name,
  }) async {
    // await _createUser(
    //   emailAddress: emailAddress,
    //   password: phoneNumberForVerification + name,
    // );
    // if (phoneNumberForVerification == null) return;
    await FirebaseAuth.instance.verifyPhoneNumber(
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
    required BuildContext context,
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
        var credential = PhoneAuthProvider.credential(
            verificationId: _verificationCode!, smsCode: smsCode);

        // await _auth.signInWithCredential(credential);
        if (_auth.currentUser == null) return;
        await _auth.currentUser!.updatePhoneNumber(credential);
        // if (email != '' && name != '' && email != null) {
        //   await _auth.currentUser?.updateDisplayName(name);
        //   await _auth.currentUser?.updateEmail(email);
        // }
        // print(_auth.currentUser?.email);
        // BotToast.showText(text: 'AcquaintanceScreen');
        // .then(
        //   (value) => Navigator.of(context, rootNavigator: true)
        //       .pushNamedAndRemoveUntil(
        //     AcquaintanceScreen.routeName,
        //     (_) => false,
        //   ),
        // );
      }
    } catch (e) {
      print(e.toString());
      BotToast.showText(text: e.toString());
    }
  }

  Future<void> _createUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     print('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //   }
    } catch (e) {
      print(e);
    }
  }
}
