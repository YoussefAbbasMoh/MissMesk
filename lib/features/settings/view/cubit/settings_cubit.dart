import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';
import 'package:miss_misq/features/settings/data/repos/settings_repo.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  List<UserAccount> accounts = [];

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
      accounts = result.data.users!;
      emit(SettingsGetAllAccountsSuccess(accounts));
    } else if (result is Failure<GetAllAccountsResponseModel>) {
      emit(SettingsGetAllAccountsFailure(result.message));
    }
  }

  Future<void> addAccount({required UserAccount user}) async {
    emit(SettingsAddAccountLoading());
    final result = await _settingsRepo.addAccount(user: user);
    if (result is Success<UserAccount>) {
      accounts.add(result.data);
      emit(SettingsAddAccountSuccess(result.data));
    } else if (result is Failure<UserAccount>) {
      emit(SettingsAddAccountFailure(result.message));
    }
  }
}
