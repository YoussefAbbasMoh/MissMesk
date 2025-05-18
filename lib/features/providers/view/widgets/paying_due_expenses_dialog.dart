import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class PayingDueExpensesDialog extends StatelessWidget {
  const PayingDueExpensesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'سداد مصروفات مستحقة',
      children: [
        const Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: ReadOnlyTextField(
                label: 'اسم المورد',
                initialValue: 'محمد إيهاب',
              ),
            ),
            Flexible(
              child: ReadOnlyTextField(label: 'كود المورد', initialValue: '12344'),
            ),
            Flexible(
              child: ReadOnlyTextField(
                label: 'أسم ممثل التوريدات',
                initialValue: 'محمدإيهاب',
              ),
            ),
            Flexible(
              child: ReadOnlyTextField(
                label: 'رقم هاتف المورد',
                initialValue: '0123456789',
              ),
            ),
          ],
        ),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: ReadOnlyTextField(label: 'نشاط المورد', initialValue: 'خامات'),
            ),
            Flexible(
              child: ReadOnlyTextField(label: 'نوع التوريدات', initialValue: 'خامات'),
            ),
            Flexible(
              flex: 2,
              child: ReadOnlyTextField(label: 'عنوان المورد', initialValue: 'القاهرة'),
            ),
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
    );
  }
}
