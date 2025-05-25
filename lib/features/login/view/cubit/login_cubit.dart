import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/login/data/models/user_model.dart';
import 'package:miss_misq/features/login/data/repos/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(email: email, password: password);
    if (result is Success<UserModel>) {
      emit(LoginSuccess(user: result.data));
    } else if (result is Failure<UserModel>) {
      emit(LoginFailure(message: result.message));
    }
  }
}
