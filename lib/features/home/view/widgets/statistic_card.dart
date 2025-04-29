import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final String amount;

  const StatisticCard({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppPallete.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 10,
          children: [
            Text(
              title,
              style: AppTextStyles.font20WhiteRegular,
              textAlign: TextAlign.center,
            ),
            Text(amount, style: AppTextStyles.font20WhiteRegular),
          ],
        ),
      ),
    );
  }
}
