import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usainua/models/user.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/services/toast_bot_servise.dart';

class SignInByGoogleService {
  SignInByGoogleService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // GoogleSignInAccount? _user;
  // GoogleSignInAccount? get user => _user;

  Future<void> googleLogin(NavigatorState navigator) async {
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
      await _auth.signInWithCredential(credential);
      final ref = FirebaseFirestore.instance
          .collection(googleUser.email)
          .doc('authUser')
          .withConverter(
            fromFirestore: LocalUser.fromFirestore,
            toFirestore: (LocalUser localUserFromFirestore, _) =>
                localUserFromFirestore.toMap(),
          );
      final docSnap = await ref.get();
      final localUserFromFirestore = docSnap.data();
      if (localUserFromFirestore != null) {
        navigator.pushNamedAndRemoveUntil(
          AcquaintanceScreen.routeName,
          (_) => false,
        );
      } else {
        await _auth.currentUser?.delete();
        const String registrationText =
            'Чтобы пользоваться приложением, Вам \nнеобходимо зарегистрироваться';
        ToastBot.showText(
          text: registrationText,
          duration: const Duration(seconds: 5),
        );
        navigator.pushNamedAndRemoveUntil(
          SignUpScreen.routeName,
          (_) => false,
        );
      }
    } catch (e) {
      await _auth.currentUser?.delete();
      ToastBot.showText(text: e.toString());
    }
  }
}
// }
