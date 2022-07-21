import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

class SignInByFbService {
  SignInByFbService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // AccessToken? _accessToken;

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

  Future<void> signInWithFacebook(context) async {
    await _auth.signOut();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token

    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      facebookAuthCredential;
      await _auth.signInWithCredential(facebookAuthCredential).then(
            (value) => Navigator.of(context, rootNavigator: true)
                .pushNamedAndRemoveUntil(
              AcquaintanceScreen.routeName,
              (_) => false,
            ),
          );
    } catch (e) {
      BotToast.showText(text: e.toString());
      print(e.toString());
    }
  }

  // Future<void> signOuth() async {
  //   await FacebookAuth.i.logOut();
  //   // _accessToken =null;
  // }
}
