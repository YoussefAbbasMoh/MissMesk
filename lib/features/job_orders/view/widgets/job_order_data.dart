import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class JobOrderData extends StatelessWidget {
  const JobOrderData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        AppCustomTextField(
          label: 'مواصفات أمر الشغل',
          titleFontSize: 14,
          hintText:
              'لتنفيذ دفعة إنتاج من 500 قطعة تيشيرت قطن 100% وفقًا للمواصفات المعتمدة. يشمل الأمر مراحل قص الأقمشة، الطباعة، الخياطة، والتعبئة، مع تحديد موعد التسليم النهائي في 25 مارس 2025. يتم استخدام أقمشة قطنية بعرض 150 سم من المورد ABC Fabrics، ويخضع الإنتاج لمعايير الجودة المحددة. المسؤول عن التنفيذ: خط الإنتاج رقم 3، مع متابعة يومية من قبل مشرف الإنتاج.',
          isRequired: false,
          minLines: 3,
          width: context.width * 0.5,
          fillColor: Colors.white,
        ),
        const VerticalSpacing(20),
        const Text(
          'بيانات أمر الشغل',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SizedBox(
          width: context.width * 0.4,
          child: const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'تاريخ التشغيل',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '12/02/2025',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'تاريخ التوريد',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '12/02/2025',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'مدة الإنتاج بالأيام',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '20',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.width * 0.6,
          child: const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'كمية الطلبية',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: '50',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'الوحدة',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: 'دستة',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'نوع المنتج',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: 'بيجامات',
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'المقاسات المطلوبة',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: 'XL , X, L, M, S',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
