import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class InstallmentsSection extends StatefulWidget {
  const InstallmentsSection({super.key});

  @override
  State<InstallmentsSection> createState() => _InstallmentsSectionState();
}

class _InstallmentsSectionState extends State<InstallmentsSection> {
  int numberOfInstallments = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCustomTextField(
          width: context.width * .15,
          label: 'اعداد الأقساط',
          hintText: 'أضف أعداد الأقساط',
          titleFontSize: 14,
        ),
        const VerticalSpacing(20),
        Column(
          children: List.generate(
            numberOfInstallments,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: context.width * .35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 20,
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
                        backgroundColor:
                            index == numberOfInstallments - 1
                                ? AppPallete.primaryColor
                                : AppPallete.greyColor.withAlpha(150),
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          numberOfInstallments == index
                              ? numberOfInstallments--
                              : numberOfInstallments++;
                        });
                      },
                      icon: Text(
                        index == numberOfInstallments - 1 ? '+' : '-',
                        style: AppTextStyles.font24WhiteSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
