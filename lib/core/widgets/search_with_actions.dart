import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';

class SearchWithActions extends StatelessWidget {
  const SearchWithActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              fillColor: AppPallete.whiteColor,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: AppPallete.lightGreyColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppPallete.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppPallete.whiteColor,
                ),
              ),
              hintText: 'بحث سريع',
              hintStyle: AppTextStyles.font14BlackRegular.copyWith(
                color: AppPallete.lightGreyColor,
              ),
            ),
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppPallete.primaryColor,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(AssetsManager.download, width: 25),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppPallete.primaryColor,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(AssetsManager.filter, width: 25),
        ),
      ],
    );
  }
}
