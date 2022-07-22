import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignInByFbService {
  SignInByFbService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // AccessToken? _accessToken;

  Future<void> signInWithFacebook(context) async {
    // await _auth.signOut();

    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.accessToken == null) return;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    try {
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
          // await _auth.signInWithAuthProvider(GoogleAuthProvider());
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

  // Future<void> signOuth() async {
  //   await FirebaseAuth.instance.currentUser?.unlink("google.com");
  //   await _auth.signOut();
  // }

  // Future<void> signInWithFacebook(context) async {
  //   // await FacebookAuth.i.logOut();
  //   final LoginResult result = await FacebookAuth.i.login();
  //   if (result.status == LoginStatus.success) {
  //     // _accessToken = result.accessToken;
  //     Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
  //       AcquaintanceScreen.routeName,
  //       (_) => false,
  //     );
  //     final Map<String, dynamic> data = await FacebookAuth.i.getUserData();
  //     print(data);
  //   }
  // }

  // Future<void> signOuth() async {
  //   await FacebookAuth.i.logOut();
  //   // _accessToken =null;
  // }
}
