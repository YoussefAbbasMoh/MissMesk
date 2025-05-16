import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class NewTransactionDialog extends StatelessWidget {
  const NewTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'معاملة جديدة',
      children: [
        const Text('بيانات المعاملة', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'رقم الفاتورة',
                hintText: 'أضف رقم الفاتورة',
                titleFontSize: 14,
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'نوع المعاملة',
                items: ['معاملة صرف نفدية', 'معاملة تسلم نقدية'],
                hintText: '',
                value: 'معاملة صرف نفدية',
                isRequired: true,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'اسم المعاملة',
                hintText: 'أضف أسم المعاملة',
                titleFontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'قيمة المعاملة',
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
                title: 'اسم المستفيد',
                items: ['محمد', 'خالد'],
                hintText: 'اختر اسم المستفيد',
                value: 'محمد',
                isRequired: true,
              ),
            ),
            const Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'طريقة الدفع',
                items: ['بنك', 'نقدي'],
                hintText: 'أدخل طريقة الدفع',
                value: 'بنك',
                isRequired: true,
              ),
            ),
          ],
        ),
        const AppCustomTextField(
          label: 'ملاحظات',
          isRequired: false,
          hintText: 'أضف ملاحظات عن المعاملة',
          titleFontSize: 14,

          minLines: 2,
        ),
      ],
    );
  }
}
