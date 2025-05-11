import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/check_box_with_title.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة مستخدم',
      iconPath: AssetsManager.management,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'بيانات المستخدم',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'الإسم',
                  hintText: 'أضف أسم المستخدم',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'البريد الإلكتروني',
                  titleFontSize: 14,
                  hintText: 'أضف البريد الإلكتروني',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'الباسورد',
                  titleFontSize: 14,
                  hintText: 'أضف الباسورد',
                ),
              ),
            ],
          ),
          const Text('الصلاحيات', style: AppTextStyles.font16BlackSemiBold),
          SizedBox(
            width: context.width * 0.6,
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                for (var title in [
                  'الكل',
                  'إدارة المخزون',
                  'إدارة الأصول',
                  'إدارة متابعة الإنتاج',
                  'إدارة سجل العملاء',
                  'إدارة سجل الموردين',
                  'دفتر اليومية',
                  'الإعدادات',
                ])
                  SizedBox(
                    width: 170, // Adjust as needed
                    child: CheckBoxWithTitle(
                      title: title,
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
