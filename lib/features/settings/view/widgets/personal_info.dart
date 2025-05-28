import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/settings/view/widgets/logout_button_with_bloc_listener.dart';
import 'package:miss_misq/features/settings/view/widgets/reset_password_button_with_bloc_listener.dart';

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
              const ResetPasswordButtonWithBlocListener(),
              const LogoutButtonWithBlocListener(),
            ],
          ),
        ),
      ],
    );
  }
}
