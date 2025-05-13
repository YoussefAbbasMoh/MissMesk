import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';

class InstallmentRow extends StatelessWidget {
  const InstallmentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .35,
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Flexible(
            child: AppCustomTextField(
              label: 'قيمة القسط',
              hintText: 'أضف قيمة القسط',
              titleFontSize: 14,
            ),
          ),
          const Flexible(
            child: AppCustomTextField(
              label: 'تاريخ سداد القسط',
              titleFontSize: 14,
              hintText: '00000000',
              suffixIcon: Icon(
                Icons.calendar_month_outlined,
                color: AppPallete.lightGreyColor,
              ),
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppPallete.greyColor.withAlpha(150),
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {},
            icon: const Text('-', style: AppTextStyles.font24WhiteSemiBold),
          ),
        ],
      ),
    );
  }
}
