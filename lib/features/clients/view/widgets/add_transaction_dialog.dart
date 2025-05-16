import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class AddTransactionDialog extends StatelessWidget {
  const AddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'معاملة توريد قسط',
      children: [
          const Text('بيانات العميل', style: AppTextStyles.font16BlackSemiBold),
          const Row(
            spacing: 20,
            children: [
              Flexible(child: _ItemField(label: 'اسم العميل')),
              Flexible(child: _ItemField(label: 'كود العميل')),
              Flexible(child: _ItemField(label: 'اسم ممثل العميل')),
              Flexible(child: _ItemField(label: 'رقم هاتف العميل')),
            ],
          ),
          SizedBox(
            width: context.width * 0.2,
            child: const _ItemField(label: 'عنوان العميل'),
          ),
          const Text('بيانات السداد', style: AppTextStyles.font16BlackSemiBold),
          Row(
            spacing: 20,
            children: [
              const Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'رقم الفاتورة',
                  items: ['1', '2', '3', '4'],
                  hintText: 'حدد رقم الفاتورة',
                  value: '1',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'قيمة القسط المورد',
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
                  value: 'نقدي',
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              const Text(
                'رقم إذن الصرف',
                style: AppTextStyles.font16BlackSemiBold,
              ),
              Text(
                'رقم أذن الصرف: 0102830',
                style: AppTextStyles.font12GreyRegular,
              ),
            ],
          ),
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
