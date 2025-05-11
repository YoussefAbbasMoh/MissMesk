import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/settings/view/widgets/add_user_dialog.dart';
import 'package:miss_misq/features/settings/view/widgets/company_settings.dart';
import 'package:miss_misq/features/settings/view/widgets/permissions_table.dart';
import 'package:miss_misq/features/settings/view/widgets/personal_info.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PersonalInfo(),
          const VerticalSpacing(20),
          const CompanySettings(),
          const VerticalSpacing(20),
          const PermissionsTable(),
          AppCustomButton(
            title: 'إضافة مستخدم',
            borderRadius: 10,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddUserDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
