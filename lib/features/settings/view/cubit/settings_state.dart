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