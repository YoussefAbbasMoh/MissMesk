import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';
import 'package:miss_misq/features/settings/data/repos/settings_repo.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  Future<void> logout() async {
    final result = await _settingsRepo.logout();
    if (result is Success) {
      emit(SettingsLogoutSuccess(result.data));
    } else if (result is Failure) {
      emit(SettingsLogoutFailure(result.message));
    }
  }

  Future<void> getAllAccounts() async {
    emit(SettingsGetAllAccountsLoading());
    final result = await _settingsRepo.getAllAccounts();
    if (result is Success<GetAllAccountsResponseModel>) {
      emit(SettingsGetAllAccountsSuccess(result.data.users!));
    } else if (result is Failure<GetAllAccountsResponseModel>) {
      emit(SettingsGetAllAccountsFailure(result.message));
    }
  }
}
