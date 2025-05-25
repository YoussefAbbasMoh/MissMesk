import 'package:miss_misq/features/login/data/models/user_model.dart';

class LoginRespoonseModel {
  final String token;
  final UserModel user;
  LoginRespoonseModel({required this.token, required this.user});

  factory LoginRespoonseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return LoginRespoonseModel(
      token: data['token'] ?? '',
      user: UserModel.fromJson(data['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user.toJson()};
  }
}
