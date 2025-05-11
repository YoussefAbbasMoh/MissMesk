import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'البيانات الشخصية',
          style: AppTextStyles.font16BlackSemiBold,
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
                  label: 'الإسم الكامل',
                  hintText: 'عمر عبد العزيز اسلام',
                  fillColor: Colors.white,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 16,
                  label: 'الإسم الكامل',
                  hintText: 'عمر عبد العزيز اسلام',
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
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.end,
            // textBaseline: TextBaseline.ideographic,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  fillColor: Colors.white,
                  label: 'رقم الهاتف',
                  titleFontSize: 16,
                  hintText: '012345678910',
                  isRequired: false,
                ),
              ),
              const Flexible(
                child: AppCustomTextField(
                  fillColor: Colors.white,
                  titleFontSize: 16,
                  label: 'كلمة المرور',
                  hintText: '********',
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomButton(
                  title: 'تغيير كلمة المرور',
                  onPressed: () {},
                  borderRadius: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
