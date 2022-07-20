import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';

class AuthReposytory {
  AuthReposytory({this.phoneNumberForVerification});

  // Phone Auth
  String? phoneNumberForVerification;
  String verificationCode = '';
  String smsCode = '555555';
  FirebaseAuth auth = FirebaseAuth.instance;
  bool? isNewUser;

  void setPhoneNumberForVerification(String value) {
    phoneNumberForVerification = value;
  }

  Future<void> verifyPhoneNumber() async {
    if (phoneNumberForVerification == null) return;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerification!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {}
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print('${e.message}!!!!!!!!!!!!!!');
        if (e.code == 'invalid-phone-number') {
          // print(phoneNumberForVerification);
          // print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verificationCode = verificationId;
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) async {
        verificationCode = verificationId;
      },
    );
  }

  Future<void> sendCodeToFirebase() async {
    try {
      if (verificationCode != '' && smsCode.length == 6) {
        var credential = PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: smsCode);

        await auth.signInWithCredential(credential).then((value) {
          // isNewUser = value.additionalUserInfo?.isNewUser;
          // print('4'+value. .toString());
          // Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          //   YouSuperPage.routeName,
          //   (_) => false,
          // );
          print('user logged in');
        });
      }
    } catch (_) {
      print('wrong pass');
      throw Exception('wrong pass');
    }
  }

  // google auth
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogin() async {
    print('googleLogin1');
    final googleUser = await googleSignIn.signIn();
    print('googleLogin11');
    if (googleUser == null) return;
    print('googleLogin1');
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // await auth.signInWithCredential(credential);
    try {
      await auth.signInWithCredential(credential).then((value) {
        // isNewUser = value.additionalUserInfo?.isNewUser;
        // print('4'+value. .toString());
        // Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        //   YouSuperPage.routeName,
        //   (_) => false,
        // );
        print('user logged in');
      });
    } catch (_) {
      print('wrong pass');
      throw Exception('wrong pass');
    }
  }
}
