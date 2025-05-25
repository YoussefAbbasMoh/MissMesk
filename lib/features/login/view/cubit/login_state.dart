part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({required this.user});
}

final class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}
