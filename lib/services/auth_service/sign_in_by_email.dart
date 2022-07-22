import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';

// class SignInByEmailService {
//   SignInByEmailService();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // GoogleSignInAccount? _user;
//   // GoogleSignInAccount? get user => _user;

//   Future<void> createUser({
//     required String emailAddress,
//     required String password,
//   }) async {
//     // await _auth.currentUser.updatePhoneNumber(phoneCredential);
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailAddress,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
