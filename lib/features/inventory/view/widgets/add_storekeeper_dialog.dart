import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class AddStorekeeperDialog extends StatelessWidget {
  const AddStorekeeperDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة أمين مخزن',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('بيانات الأمين', style: AppTextStyles.font16BlackSemiBold),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            spacing: 20,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'اسم الأمين',
                  titleFontSize: 14,
                  hintText: 'أضف اسم الأمين ',
                  isRequired: false,
                ),
              ),
              const Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'المخزن',
                  hintText: 'حدد اسم المخزن',
                  items: ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                  value: 'مخزن 1',
                ),
              ),
              Flexible(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
