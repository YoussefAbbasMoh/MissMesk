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

  Future<void> addAccount({required UserAccount user}) async {
    emit(SettingsAddAccountLoading());
    final result = await _settingsRepo.addAccount(user: user);
    if (result is Success) {
      emit(SettingsAddAccountSuccess());
    } else if (result is Failure) {
      emit(SettingsAddAccountFailure(result.message));
    }
  }

  Future<void> resetUserPassword({required String newPassword}) async {
    emit(SettingsResetPasswordLoading());
    final result = await _settingsRepo.resetUserPassword(
      newPassword: newPassword,
    );
    if (result is Success) {
      emit(SettingsResetPasswordSuccess(result.data));
    } else if (result is Failure) {
      emit(SettingsResetPasswordFailure(result.message));
    }
  }

  Future<void> deleteAccount({required String id}) async {
    emit(SettingsDeleteAccountLoading());
    final result = await _settingsRepo.deletAccount(id: id);
    if (result is Success) {
      emit(SettingsDeleteAccountSuccess(result.data));
    } else if (result is Failure) {
      emit(SettingsDeleteAccountFailure(result.message));
    }
  }
}
