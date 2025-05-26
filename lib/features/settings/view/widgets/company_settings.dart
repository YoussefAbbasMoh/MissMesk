import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class CompanySettings extends StatelessWidget {
  const CompanySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('اعدادات الشركة', style: AppTextStyles.font16BlackSemiBold),
        const VerticalSpacing(20),
        SizedBox(
          width: context.width * 0.6,
          child: const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'اسم الشركة',
                  initialValue: 'Miss Misk',
                  hintText: 'ادخل اسم الشركة',
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'رفع اللوجو',
                  hintText: 'تغيير الصورة',
                  prefixIcon: Icon(
                    Icons.camera_alt,
                    color: AppPallete.lightGreyColor,
                  ),
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(child: SizedBox()),
            ],
          ),
        ),
        const VerticalSpacing(20),
        SizedBox(
          width: context.width * 0.6,
          child: const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'العنوان',
                  initialValue: '17 شارع , القاهرة , مصر',
                  hintText: 'ادخل عنوان الشركة',
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'العملة الافتراضية',
                  initialValue: 'الجنيه',
                  hintText: 'ادخل العملة الافتراضية',
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(child: SizedBox()),
            ],
          ),
        ),
        const VerticalSpacing(20),
        SizedBox(
          width: context.width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 20,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'الرقم الضريبي',
                  initialValue: '343354651',
                  hintText: 'ادخل الرقم الضريبي',
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  items: const ['الجنيه', 'الدولار', 'اليورو'],
                  value: 'الجنيه',
                  title: 'العملة الافتراضية',
                  hintText: 'الجنيه',
                  fillColor: Colors.white,
                  isRequired: false,
                  onChanged: (value) {},
                ),
              ),
              Flexible(
                child: AppCustomButton(
                  title: 'حفظ التعديلات',
                  borderRadius: 10,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
