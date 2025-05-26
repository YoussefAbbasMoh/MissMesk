part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLogoutSuccess extends SettingsState {
  final String message;

  SettingsLogoutSuccess(this.message);
}

final class SettingsLogoutFailure extends SettingsState {
  final String message;

  SettingsLogoutFailure(this.message);
}
