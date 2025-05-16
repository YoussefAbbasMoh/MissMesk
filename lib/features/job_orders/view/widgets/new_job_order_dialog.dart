import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class NewJobOrderDialog extends StatelessWidget {
  const NewJobOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCustomDialog(
      title: 'إنشاء أمر شغل جديد',
      children: [
        Text('بيانات أمر الشغل', style: AppTextStyles.font16BlackSemiBold),
        Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'تاريخ التشغيل',
                hintText: '00000000',
                titleFontSize: 14,
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: AppPallete.lightGreyColor,
                ),
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'تاريخ التوريد',
                hintText: '00000000',
                titleFontSize: 14,
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: AppPallete.lightGreyColor,
                ),
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'مدة الإنتاج بالأيام',
                hintText: '00000000',
                isRequired: false,
                titleFontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'كمية الطبية',
                hintText: 'أضف الكمية',
                titleFontSize: 14,
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'الوحدة',
                items: ['دستة', 'نص دستة'],
                hintText: 'حدد الوحدة',
                value: 'دستة',
              ),
            ),
            Flexible(child: SizedBox()),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'اسم المنتج',
                hintText: 'أضف أسم المنتج',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'المقاسات المطلوبة',
                hintText: 'أضف المقاسات',
                titleFontSize: 14,
              ),
            ),
            Flexible(child: SizedBox()),
          ],
        ),
        AppCustomTextField(
          label: 'وصف أمر الشغلة',
          hintText: 'أضف وصف أمر الشغل',
          titleFontSize: 14,
          minLines: 3,
          isRequired: false,
        ),
      ],
    );
  }
}
