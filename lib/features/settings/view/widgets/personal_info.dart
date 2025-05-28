import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/are_you_sure_dialog.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:toastification/toastification.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  dynamic getUserData() {
    final data = jsonDecode(CachHelper.getString(key: 'user') ?? '{}');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'البيانات الشخصية',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        const VerticalSpacing(20),
        SizedBox(
          width: context.width * 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'الإسم الكامل',
                  hintText: '',
                  fillColor: Colors.white,
                  isRequired: false,
                  initialValue: getUserData()['name'] ?? '',
                  isReadOnly: true,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'البريد الإلكتروني',
                  hintText: '',
                  fillColor: Colors.white,
                  isRequired: false,
                  initialValue: getUserData()['email'] ?? '',
                  isReadOnly: true,
                ),
              ),
              Flexible(
                child: AppCustomButton(
                  title: 'تغيير كلمة المرور',
                  onPressed: () {},
                  borderRadius: 10,
                ),
              ),
              BlocListener<SettingsCubit, SettingsState>(
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
                  } else if (state is SettingsLogoutFailure) {
                    showToastification(
                      message: state.message,
                      type: ToastificationType.error,
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
                              onConfirm: settingsCubit.logout,
                            ),
                      );
                    },
                    borderRadius: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
