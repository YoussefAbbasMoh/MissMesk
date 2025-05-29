part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

// Logout

final class SettingsLogoutLoading extends SettingsState {}

final class SettingsLogoutSuccess extends SettingsState {
  final String message;

  SettingsLogoutSuccess(this.message);
}

final class SettingsLogoutFailure extends SettingsState {
  final String message;

  SettingsLogoutFailure(this.message);
}

// Get All Accounts

final class SettingsGetAllAccountsLoading extends SettingsState {}

final class SettingsGetAllAccountsSuccess extends SettingsState {
  final List<UserAccount> accounts;

  SettingsGetAllAccountsSuccess(this.accounts);
}

// Add Account

final class SettingsGetAllAccountsFailure extends SettingsState {
  final String message;

  SettingsGetAllAccountsFailure(this.message);
}

final class SettingsAddAccountLoading extends SettingsState {}

final class SettingsAddAccountSuccess extends SettingsState {
  final UserAccount user;

  SettingsAddAccountSuccess(this.user);
}

final class SettingsAddAccountFailure extends SettingsState {
  final String message;

  SettingsAddAccountFailure(this.message);
}

// Reset Password

final class SettingsResetPasswordLoading extends SettingsState {}

final class SettingsResetPasswordSuccess extends SettingsState {
  final String message;

  SettingsResetPasswordSuccess(this.message);
}

final class SettingsResetPasswordFailure extends SettingsState {
  final String message;

  SettingsResetPasswordFailure(this.message);
}

// Delete Account

final class SettingsDeleteAccountLoading extends SettingsState {}

final class SettingsDeleteAccountSuccess extends SettingsState {
  final String message;

  SettingsDeleteAccountSuccess(this.message);
}

final class SettingsDeleteAccountFailure extends SettingsState {
  final String message;

  SettingsDeleteAccountFailure(this.message);
}
