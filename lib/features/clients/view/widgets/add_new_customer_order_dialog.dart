import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/switch_row.dart';
import 'package:miss_misq/features/providers/view/widgets/installments_section.dart';

class AddNewCustomerOrderDialog extends StatelessWidget {
  const AddNewCustomerOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة طلبية جديدة',
      children: [
        const Text('بيانات العميل', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(child: _ItemField(label: 'اسم العميل')),
            Flexible(child: _ItemField(label: 'كود العميل')),
            Flexible(child: _ItemField(label: 'نوع العميل')),
            Flexible(child: _ItemField(label: 'اسم ممثل العميل')),
          ],
        ),
        const Row(
          spacing: 20,
          children: [
            Flexible(child: _ItemField(label: 'رقم هاتف العميل')),
            Flexible(flex: 2, child: _ItemField(label: 'عنوان المورد')),
            Flexible(child: SizedBox()),
          ],
        ),
        const Text('بيانات الطلبية', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'رقم الفاتورة',
                hintText: 'أضف أسم الأصل',
                titleFontSize: 14,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'تاريخ الطلب',
                titleFontSize: 14,
                hintText: '00000000',
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppPallete.lightGreyColor,
                ),
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'تاريخ التسلم',
                hintText: '00000000',
                titleFontSize: 14,
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppPallete.lightGreyColor,
                ),
              ),
            ),
          ],
        ),
        const AppCustomTextField(
          label: 'وصف الطلبية',
          hintText: 'أضف وصف الطلبية',
          isRequired: false,
          titleFontSize: 14,
          minLines: 3,
        ),
        const Text(
          'البيانات المالية',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        AppCustomTextField(
          width: context.width * .15,
          label: 'إجمالي سعر الفاتورة',
          hintText: 'أضف أسم الأصل',
          titleFontSize: 14,
        ),
        const VerticalSpacing(10),
        SwitchRow(
          label: 'السداد على أقساط',
          value: true,
          onChanged: (value) {},
        ),
        const InstallmentsSection(),
      ],
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
