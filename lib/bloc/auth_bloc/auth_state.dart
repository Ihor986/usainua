part of 'auth_bloc.dart';

class AuthState {
  // AuthState({required this.authService});
  final AuthService authService = AuthService();
  final AuthReposytory authReposytory = AuthReposytory();
}
