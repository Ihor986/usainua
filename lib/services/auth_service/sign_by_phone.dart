import 'package:firebase_auth/firebase_auth.dart';

import '../toast_bot_servise.dart';

abstract class VerifyByPhoneService {
  VerifyByPhoneService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationCode;

  Future<void> verifyPhoneNumber({
    required String phoneNumberForVerification,
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerification,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ToastBot.showText(text: e.toString());
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
}
