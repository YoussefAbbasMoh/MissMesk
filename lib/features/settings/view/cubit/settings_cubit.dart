import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/settings/data/repos/settings_repo.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  Future<void> logout() async {
    final result = await _settingsRepo.logout();
    if (result is Success) {
      print('asdasd');
      emit(SettingsLogoutSuccess(result.data));
    } else if (result is Failure) {
      emit(SettingsLogoutFailure(result.message));
    }
  }
}
