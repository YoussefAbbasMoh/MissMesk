import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class CostSummary extends StatelessWidget {
  const CostSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('إجمالي التكاليف', style: AppTextStyles.font16BlackSemiBold),
        Text(
          'إجمالي تكلفة الخامات: 897978 ج. م',
          style: AppTextStyles.font12GreyRegular,
        ),
        Text(
          'إجمالي تكلفة الإهلاك: 550 ج. م',
          style: AppTextStyles.font12GreyRegular,
        ),
        Text(
          'إجمالي المصروفات الأخرى: 8788 ج. م',
          style: AppTextStyles.font12GreyRegular,
        ),
        const VerticalSpacing(35),
        const Text('نسب مضافة', style: AppTextStyles.font16BlackSemiBold),
        const VerticalSpacing(15),
        SizedBox(
          width: context.width * 0.3,
          child: const Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'نسبة هامش الربح',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '20%',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'القيمة',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '79990',
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacing(5),
        SizedBox(
          width: context.width * 0.3,
          child: const Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'نسبة هامش الربح',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '20%',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'القيمة',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '79990',
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacing(5),
        SizedBox(
          width: context.width * 0.3,
          child: const Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'نسبة هامش الربح',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '20%',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'القيمة',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '79990',
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacing(35),
        const Text(
          'إجمالي التكلفة التفديرية لأمر الشغل',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        Text(
          'إجمالي التكلفة التقديرية: 1029383 ج. م',
          style: AppTextStyles.font12GreyRegular,
        ),
        const VerticalSpacing(15),
        const Text(
          'إجمالي التكلفة التفديرية للمنتج',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        Text(
          'إجمالي التكلفة التقديرية: 102 ج. م',
          style: AppTextStyles.font12GreyRegular,
        ),
      ],
    );
  }
}
