import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignInByPhoneService {
  SignInByPhoneService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _phoneNumberForVerification;
  String? _verificationCode;
  final String _smsCode = '555555';

  void setPhoneNumberForVerification(String value) {
    _phoneNumberForVerification = value;
  }

  Future<void> verifyPhoneNumber() async {
    if (_phoneNumberForVerification == null) return;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneNumberForVerification!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {}
        });
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

  Future<void> sendCodeToFirebase(BuildContext context) async {
    try {
      if (_verificationCode != '' && _smsCode.length == 6) {
        var credential = PhoneAuthProvider.credential(
            verificationId: _verificationCode ?? '', smsCode: _smsCode);

        await _auth.signInWithCredential(credential).then(
              (value) => Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil(
                AcquaintanceScreen.routeName,
                (_) => false,
              ),
            );
      }
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }
}
