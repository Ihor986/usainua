import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usainua/models/user.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<LocalUser?> getUser(
      // {required LocalUser user, required String? id}
      ) async {
    if (_auth.currentUser == null) return null;
    try {
      final ref = FirebaseFirestore.instance
          .collection(_auth.currentUser!.email.toString())
          .doc('authUser')
          .withConverter(
            fromFirestore: LocalUser.fromFirestore,
            toFirestore: (LocalUser localUserFromFirestore, _) =>
                localUserFromFirestore.toMap(),
          );
      final docSnap = await ref.get();
      final localUserFromFirestore = docSnap.data();

      return localUserFromFirestore;
    } catch (e) {
      return null;
    }
  }
}
