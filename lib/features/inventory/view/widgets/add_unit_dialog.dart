import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';

class AddUnitDialog extends StatelessWidget {
  const AddUnitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة وحدة قياس جديدة',
      iconPath: AssetsManager.management,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'بيانات وحدة القياس',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          Row(
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'الوحدة',
                  hintText: 'ضع وحدة القياس او التخزين',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
              Flexible(child: Container()),
              Flexible(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
