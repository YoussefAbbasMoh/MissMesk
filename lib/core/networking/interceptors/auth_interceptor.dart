import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/app_router.dart';
import 'package:miss_misq/core/routing/routes.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getToken;

  AuthInterceptor({required this.getToken});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = 'Misk $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.data['message'] == 'Token Invalid') {
      AppRouter.rootNavigatorKey.currentContext?.go(AppRoutes.login);
    } else if (err.response?.data['message'] == 'Token Expired') {
      AppRouter.rootNavigatorKey.currentContext?.go(AppRoutes.login);
    } else if (err.response?.data['message'] ==
        'You are not authorized to access this route') {
      AppRouter.rootNavigatorKey.currentContext?.go(AppRoutes.login);
    }
    return handler.next(err);
  }
}
