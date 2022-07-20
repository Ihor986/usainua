import 'package:usainua/services/auth_service/sign_in_by_google_service.dart';
import 'package:usainua/services/auth_service/sign_in_by_phone_service.dart';

class AuthReposytory {
  AuthReposytory();

  final SignInByPhoneService _signInByPhoneService = SignInByPhoneService();
  final SignInByGoogleService _signInByGoogleService = SignInByGoogleService();

  // Phone Auth
  void setPhoneNumberForVerification(String phoneNumber) {
    _signInByPhoneService.setPhoneNumberForVerification(phoneNumber);
  }

  Future<void> verifyPhoneNumber() async {
    await _signInByPhoneService.verifyPhoneNumber();
  }

  Future<void> sendCodeToFirebase(context) async {
    await _signInByPhoneService.sendCodeToFirebase(context);
  }

  // google auth
  Future<void> googleLogin(context) async {
    await _signInByGoogleService.googleLogin(context);
  }
}
