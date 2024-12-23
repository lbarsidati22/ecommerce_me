abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailedState extends AuthState {
  final String error;

  LoginFailedState({required this.error});
}

class LoginLeadingState extends AuthState {}
