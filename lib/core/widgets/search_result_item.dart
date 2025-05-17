import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppPallete.primaryColor.withAlpha(30),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Text(
              title,
              style: AppTextStyles.font16BlackSemiBold.copyWith(fontSize: 14),
            ),
            Text('1019871', style: AppTextStyles.font12GreyRegular),
          ],
        ),
      ),
    );
  }
}
