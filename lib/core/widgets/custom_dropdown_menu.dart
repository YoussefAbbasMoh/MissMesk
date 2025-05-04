import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;
  final String hintText;
  final double? width;

  const CustomDropdownMenu({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.hintText = 'اختر',
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppPallete.lightGreyColor, width: 1.5),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          hintText,
          style: AppTextStyles.font14BlackRegular.copyWith(
            color: AppPallete.lightGreyColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        onChanged: onChanged,
        items:
            items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: AppPallete.greyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
        underline: const SizedBox(),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: AppPallete.greyColor,
          size: 24,
        ),
        isExpanded: false,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
        style: AppTextStyles.font14BlackRegular,
        elevation: 2,
      ),
    );
  }
}
