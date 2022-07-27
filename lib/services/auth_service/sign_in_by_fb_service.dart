import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:usainua/models/user.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/services/toast_bot_servise.dart';

class SignInByFbService {
  SignInByFbService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithFacebook(NavigatorState navigator) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.accessToken == null) return;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    try {
      var i = await _auth.signInWithCredential(credential);
      // print(i.user?.providerData.elementAt(0).email);
      await _auth.currentUser
          ?.updateEmail(i.user?.providerData.elementAt(0).email ?? '');
      final ref = FirebaseFirestore.instance
          .collection(i.user?.providerData.elementAt(0).email ?? '')
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

  // Future<void> _getData() async {
  //   // await FacebookAuth.i.logOut();
  //   final LoginResult result = await FacebookAuth.i.login();
  //   if (result.status == LoginStatus.success) {
  //     // _accessToken = result.accessToken;
  //     // navigator.pushNamedAndRemoveUntil(
  //     //   AcquaintanceScreen.routeName,
  //     //   (_) => false,
  //     // );
  //     final Map<String, dynamic> data = await FacebookAuth.i.getUserData();
  //     // return data;
  //     print(data);
  //   }
  // }
  // Future<void> signOuth() async {
  //   await FacebookAuth.i.logOut();
  //   // _accessToken =null;
  // }
}
