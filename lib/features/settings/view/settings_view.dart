import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/settings/view/widgets/add_user_button_and_bloc_listener.dart';
import 'package:miss_misq/features/settings/view/widgets/company_settings.dart';
import 'package:miss_misq/features/settings/view/widgets/permissions_table.dart';
import 'package:miss_misq/features/settings/view/widgets/personal_info.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PersonalInfo(),
          VerticalSpacing(20),
          CompanySettings(),
          VerticalSpacing(20),
          PermissionsTable(),
          AddUserButtonAndBlocListener(),
        ],
      ),
    );
  }
}
