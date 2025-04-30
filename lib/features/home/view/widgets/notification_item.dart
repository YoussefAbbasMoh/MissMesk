import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.iconPath,
  });

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(iconPath),
          Expanded(
            child: Text(title, style: AppTextStyles.font16WhiteSemiBold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }
}

