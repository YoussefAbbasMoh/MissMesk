import 'package:flutter/material.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class CreateClientAccountDialog extends StatelessWidget {
  const CreateClientAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إنشاء حساب عميل',
      children: [
        const Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'اسم العميل',
                hintText: 'أضف اسم العميل',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'نوع العميل',
                items: ['نوع 1', 'نوع 2', 'نوع 3', 'نوع 4'],
                hintText: 'اختر نوع العميل',
                value: 'نوع 1',
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'كود العميل',
                hintText: '092660',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
          ],
        ),
        const Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              flex: 2,
              child: AppCustomTextField(
                label: 'عنوان العميل',
                hintText: 'أضف عنوان العميل',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'أسم ممثل العميل',
                hintText: 'أضف أسم ممثل العميل',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
          ],
        ),
        AppCustomTextField(
          width: context.width * .14,
          label: 'عنوان العميل',
          hintText: 'أضف عنوان العميل',
          titleFontSize: 14,
          isRequired: false,
        ),
        const AppCustomTextField(
          label: 'وصف العميل',
          hintText: 'أضف وصف للعميل',
          minLines: 2,
          titleFontSize: 14,
          isRequired: false,
        ),
      ],
    );
  }
}
