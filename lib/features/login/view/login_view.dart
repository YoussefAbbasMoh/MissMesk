import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/features/login/view/cubit/login_cubit.dart';
import 'package:miss_misq/features/login/view/widgets/credits_section.dart';
import 'package:miss_misq/features/login/view/widgets/login_form.dart';
import 'package:toastification/toastification.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final List loginStates = List.unmodifiable([
    LoginLoading,
    LoginSuccess,
    LoginFailure,
  ]);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen:
                (state, previous) => loginStates.contains(state.runtimeType),
            listener: (context, state) {
              if (state is LoginFailure) {
                showToastification(
                  message: state.message,
                  type: ToastificationType.error,
                );
              } else if (state is LoginSuccess) {
                while (GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                }
                context.pushReplacement(AppRoutes.home);
                showToastification(
                  message: 'تم تسجيل الدخول بنجاح',
                  type: ToastificationType.success,
                );
              } else if (state is LoginLoading) {
                showToastification(
                  message: 'جاري تسجيل الدخول...',
                  type: ToastificationType.info,
                );
              }
            },
            child: const SingleChildScrollView(
              child: Center(
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_LogoSection(), LoginForm(), CreditsSection()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.logo,
      width: 250,
      height: 200,
      fit: BoxFit.fill,
    );
  }
}
