import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/breadcrumbs.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.whiteColor,
      scrolledUnderElevation: 0,
      leadingWidth: 0,
      title: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppPallete.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 8),
            child: Row(
              spacing: 5,
              children: [
                const Text('Ahmed', style: AppTextStyles.font20WhiteRegular),
                SvgPicture.asset(AssetsManager.person),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppPallete.primaryColor,
            ),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(AssetsManager.notification),
          ),
          const Breadcrumbs(),
        ],
      ),
    );
  }
}
