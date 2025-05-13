import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class PayingDueExpensesDialog extends StatelessWidget {
  const PayingDueExpensesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'سداد مصروفات مستحقة',
      iconPath: AssetsManager.management,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
          const Row(
            spacing: 20,
            children: [
              Flexible(child: _ItemField(label: 'اسم المورد')),
              Flexible(child: _ItemField(label: 'كود المورد')),
              Flexible(child: _ItemField(label: 'أسم ممثل التوريدات')),
              Flexible(child: _ItemField(label: 'رقم هاتف المورد')),
            ],
          ),
          const Row(
            spacing: 20,
            children: [
              Flexible(child: _ItemField(label: 'نشاط المورد')),
              Flexible(child: _ItemField(label: 'نوع التوريدات')),
              Flexible(flex: 2, child: _ItemField(label: 'عنوان المورد')),
            ],
          ),
          const Text('بيانات السداد', style: AppTextStyles.font16BlackSemiBold),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            spacing: 10,
            children: [
              const Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'رقم الفاتورة',
                  items: ['1', '2', '3', '4'],
                  hintText: 'حدد رقم الفاتورة',
                  value: '1',
                  isRequired: true,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'المبلغ المدفوع ',
                  hintText: 'أضف المبلغ',
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
                child: DropdownTextFieldWithTitle(
                  title: 'طريقة السداد',
                  items: ['تحويل بنكي', 'نقدي'],
                  hintText: 'حدد طريقة السداد',
                  value: 'تحويل بنكي',
                  isRequired: true,
                ),
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('رقم إذن الصرف', style: AppTextStyles.font16BlackSemiBold),
              Text(
                'رقم إذن الصرف : 12345',
                style: AppTextStyles.font14BlackRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _ItemField extends StatelessWidget {
  final String label;

  const _ItemField({required this.label});

  @override
  Widget build(BuildContext context) {
    return AppCustomTextField(
      titleFontSize: 14,
      label: label,
      isRequired: false,
      hintText: 'ادخل $label',
      hintTextStyle: AppTextStyles.font14GreyRegular,
      fillColor: const Color(0XFFEDE0CC),
    );
  }
}
