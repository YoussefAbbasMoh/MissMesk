import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class CreateProviderAccountDialog extends StatelessWidget {
  const CreateProviderAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إنشاء حساب مورد',
      iconPath: AssetsManager.management,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم المورد',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: 'أضف أسم المورد',
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'نشاط المورد',
                  items: ['خامات', 'منتجات', 'خامات و منتجات'],
                  hintText: 'اختر نشاط المورد',
                  value: 'خامات',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'كود المورد',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: '0182829',
                ),
              ),
            ],
          ),
          Row(
            spacing: 20,
            children: [
              Flexible(
                flex: 2,
                child: AppCustomTextField(
                  label: 'عنوان المورد',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: 'أضف عنوان المورد',
                ),
              ),
              Flexible(
                flex: 1,
                child: AppCustomTextField(
                  label: 'أسم ممثل التوريدات',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: 'أضف أسم ممثل التوريدات',
                ),
              ),
            ],
          ),
          Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'رقم الهاتف',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: 'أضف رقم الهاتف',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'نوع التوريدات',
                  titleFontSize: 14,
                  isRequired: false,
                  hintText: 'أضف نوع التوريدات',
                ),
              ),
              Flexible(child: SizedBox()),
            ],
          ),
          AppCustomTextField(
            label: 'الوصف',
            titleFontSize: 14,
            minLines: 2,
            isRequired: false,
            hintText: 'ادخل الوصف',
          ),
        ],
      ),
    );
  }
}
