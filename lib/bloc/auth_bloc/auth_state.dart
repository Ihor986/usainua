part of 'auth_bloc.dart';

class AuthState {
  // AuthState({required this.authService});
  final AuthService authService = AuthService();
  final AuthReposytory authReposytory = AuthReposytory();
  String getFormatedPhone() {
    return StringFormater.formatPhoneNumber(
      authService.phoneInputController.text,
    );
    // String number = authService.phoneInputController.text;
    // String formatedNumber = '';
    // formatedNumber = '${number.substring(0, 3)} ';
    // formatedNumber = '$formatedNumber${number.substring(3, 6)} ';
    // formatedNumber = '$formatedNumber${number.substring(6, 9)} ';
    // formatedNumber = '$formatedNumber${number.substring(9)}';
    // return formatedNumber;
  }
}
