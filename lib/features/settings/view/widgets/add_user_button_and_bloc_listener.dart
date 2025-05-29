import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:miss_misq/features/settings/view/widgets/add_user_dialog.dart';
import 'package:toastification/toastification.dart';

class AddUserButtonAndBlocListener extends StatelessWidget {
  const AddUserButtonAndBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen:
          (previous, current) =>
              current is SettingsAddAccountSuccess ||
              current is SettingsAddAccountFailure ||
              current is SettingsAddAccountLoading,
      listener: (context, state) {
        if (state is SettingsAddAccountSuccess) {
          context.pop();
          showToastification(
            message: 'تم اضافة المستخدم بنجاح',
            type: ToastificationType.success,
          );
        } else if (state is SettingsAddAccountFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is SettingsAddAccountLoading) {
          showLoading(context);
        }
      },
      child: AppCustomButton(
        title: 'إضافة مستخدم',
        borderRadius: 10,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddUserDialog(),
          );
        },
      ),
    );
  }
}
