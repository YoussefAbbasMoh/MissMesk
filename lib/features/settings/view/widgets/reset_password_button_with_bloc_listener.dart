import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:miss_misq/features/settings/view/widgets/reset_password_dialog.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordButtonWithBlocListener extends StatelessWidget {
  const ResetPasswordButtonWithBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen:
          (previous, current) =>
              current is SettingsResetPasswordLoading ||
              current is SettingsResetPasswordSuccess ||
              current is SettingsResetPasswordFailure,
      listener: (context, state) {
        if (state is SettingsResetPasswordSuccess) {
          context.pop();
          GoRouter.of(context).go(AppRoutes.login);
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
        } else if (state is SettingsResetPasswordFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is SettingsResetPasswordLoading) {
          showLoading(context);
        }
      },
      child: AppCustomButton(
        title: 'تغيير كلمة المرور',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const ResetPasswordDialog(),
          );
        },
        borderRadius: 10,
      ),
    );
  }
}
