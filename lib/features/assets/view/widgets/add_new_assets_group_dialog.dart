import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';

class AddNewAssetsGroupDialog extends StatelessWidget {
  const AddNewAssetsGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة مجموعة أصول جديدة',
      iconPath: AssetsManager.management,
      child: const Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('بيانات المجموعة', style: AppTextStyles.font16BlackSemiBold),
          Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم مجموعة الأصول',
                  hintText: 'قماش بليسيه أبيض',
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'كود مجموعة الأصول',
                  hintText: '718668526',
                  titleFontSize: 14,
                ),
              ),
              Flexible(child: SizedBox()),
            ],
          ),
          AppCustomTextField(
            isRequired: false,
            label: 'وصف المجموعة',
            titleFontSize: 14,
            hintText: 'أضف وصف الصنف',
            minLines: 2,
          ),
        ],
      ),
    );
  }
}
