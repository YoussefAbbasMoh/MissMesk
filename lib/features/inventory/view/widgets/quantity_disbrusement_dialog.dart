import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class QuantityDisbrusementDialog extends StatefulWidget {
  const QuantityDisbrusementDialog({super.key});

  @override
  State<QuantityDisbrusementDialog> createState() =>
      _QuantityDisbrusementDialogState();
}

class _QuantityDisbrusementDialogState
    extends State<QuantityDisbrusementDialog> {
  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'صرف كمية',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات الصنف', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          Row(
            spacing: 10,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'كود الصنف',
                  isRequired: false,
                  hintText: 'ادخل كود الصنف',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                  fillColor: const Color(0XFFEDE0CC),
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'اسم الصنف',
                  isRequired: false,
                  hintText: 'ادخل كود الصنف',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                  fillColor: const Color(0XFFEDE0CC),
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'نوع الصنف',
                  isRequired: false,
                  hintText: 'ادخل كود الصنف',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                  fillColor: const Color(0XFFEDE0CC),
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  hintText: 'متر',
                  titleFontSize: 14,
                  label: 'الوحدة',
                  isRequired: false,
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                  fillColor: const Color(0XFFEDE0CC),
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 30),
          const Text(
            'بيانات عملية الإضافة',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 10),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'كود الكمية',
                  hintText: '019910XX',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Expanded(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'الكمية المنصرفة',
                  hintText: 'أدخل الكمية المنصرفة',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Expanded(
                child: DropdownTextFieldWithTitle(
                  onChanged: (value) {},
                  title: 'رقم أمر الشغل',
                  items: const ['رقم 1', 'رقم 2', 'رقم 3', 'رقم 4'],
                  hintText: 'أختر رقم أمر الشغل',
                  value: 'رقم 1',
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 20),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'كود الكمية',
                  hintText: '019910XX',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Expanded(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'الكمية المنصرفة',
                  hintText: 'أدخل الكمية المنصرفة',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
