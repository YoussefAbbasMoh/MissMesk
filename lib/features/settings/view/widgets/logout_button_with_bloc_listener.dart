import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/are_you_sure_dialog.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:toastification/toastification.dart';

class LogoutButtonWithBlocListener extends StatelessWidget {
  const LogoutButtonWithBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen:
          (previous, current) =>
              current is SettingsLogoutSuccess ||
              current is SettingsLogoutFailure ||
              current is SettingsLogoutLoading,
      listener: (context, state) {
        if (state is SettingsLogoutSuccess) {
          context.go(AppRoutes.login);
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
        }
      },
      child: Flexible(
        child: AppCustomButton(
          color: AppPallete.darkRedColor,
          title: 'تسجيل الخروج',
          onPressed: () {
            final settingsCubit = context.read<SettingsCubit>();
            showDialog(
              context: context,
              builder:
                  (context) => AreYouSureDialog(
                    title: 'هل تريد تسجيل الخروج؟',
                    cubit: settingsCubit,
                    onConfirm: () => settingsCubit.logout(),
                  ),
            );
          },
          borderRadius: 10,
        ),
      ),
    );
  }
}
