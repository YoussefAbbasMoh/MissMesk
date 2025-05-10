import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class AddNewAssetsAccountDialog extends StatelessWidget {
  const AddNewAssetsAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة حساب أصول جديد',
      iconPath: AssetsManager.management,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات الحساب', style: AppTextStyles.font16BlackSemiBold),
          const Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'اسم مجموعة الأصول',
                  isRequired: true,
                  items: ['مجموعة 1', 'مجموعة 2', 'مجموعة 3', 'مجموعة 4'],
                  hintText: 'حدد المجموعة',
                  value: 'مجموعة 1',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم الأصل',
                  hintText: 'أضف أسم الأصل',
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: Row(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      flex: 2,
                      child: AppCustomTextField(
                        label: 'كود مجموعة الأصول',
                        hintText: '786766',
                        titleFontSize: 14,
                        isRequired: false,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AppCustomTextField(
                        label: 'كود الأصل',
                        hintText: '980',
                        titleFontSize: 14,
                        isRequired: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'رقم فاتورة الشراء',
                  hintText: '718668526',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'سعر شراء الأصل',
                  hintText: 'أضف سعر شراء الأصل',
                  titleFontSize: 14,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        backgroundColor: AppPallete.primaryColor,
                      ),
                      onPressed: null,
                      child: const Text(
                        'ج. م.',
                        style: AppTextStyles.font16BlackSemiBold,
                      ),
                    ),
                  ),
                ),
              ),
              const Flexible(
                child: AppCustomTextField(
                  label: 'تاريخ شراء الأصل',
                  hintText: '00000000',
                  titleFontSize: 14,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: AppPallete.lightGreyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'العمر التقديري بالسنين',
                  hintText: 'أضف عدد السنين',
                  titleFontSize: 14,
                ),
              ),

              const Flexible(
                child: AppCustomTextField(
                  label: 'العمر التقديري بالأيام',
                  hintText: '00000000',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'معدل الإستهلاك اليومي',
                  hintText: 'معدل الإستهلاك اليومي',
                  isRequired: false,
                  titleFontSize: 14,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        backgroundColor: AppPallete.primaryColor,
                      ),
                      onPressed: null,
                      child: const Text(
                        'ج. م.',
                        style: AppTextStyles.font16BlackSemiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
