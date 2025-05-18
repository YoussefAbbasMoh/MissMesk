import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';

class AddItemInInvoiceDialog extends StatelessWidget {
  const AddItemInInvoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة صنف',
      children: [
        const Text(
          'بيانات الصنف داخل الفاتورة',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: ReadOnlyTextField(label: 'كود الصنف', initialValue: '123'),
            ),
            Flexible(
              child: ReadOnlyTextField(label: 'أسم الصنف', initialValue: 'قماش سادة'),
            ),
            Flexible(child: ReadOnlyTextField(label: 'الوحدة', initialValue: 'متر')),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'سعر الوحدة',
                hintText: '200',
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
                label: 'الكمية',
                hintText: 'أضف الكمية',
                titleFontSize: 14,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'إجمالي السعر',
                hintText: '200',
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
        const AppCustomTextField(
          label: 'وصف الصنف داخل الفاتورة',
          hintText: 'أضف وصف الصنف',
          titleFontSize: 14,
          isRequired: false,
          minLines: 2,
        ),
      ],
    );
  }
}
