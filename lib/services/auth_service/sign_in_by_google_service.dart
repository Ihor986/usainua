import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignInByGoogleService {
  SignInByGoogleService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // GoogleSignInAccount? _user;
  // GoogleSignInAccount? get user => _user;

  Future<void> googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    // _user = googleUser;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      // accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      //
      await _auth.signInWithCredential(credential).then(
            (value) => Navigator.of(context, rootNavigator: true)
                .pushNamedAndRemoveUntil(
              AcquaintanceScreen.routeName,
              (_) => false,
            ),
          );
    } catch (e) {
      try {
        if (_auth.currentUser == null) {
          BotToast.showText(text: e.toString());
          return;
        }
        await _auth.currentUser?.linkWithCredential(credential).then(
              (value) => Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil(
                AcquaintanceScreen.routeName,
                (_) => false,
              ),
            );
      } on FirebaseAuthException catch (e) {
        BotToast.showText(text: e.code);
      }
    }
  }
}
