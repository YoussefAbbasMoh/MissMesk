import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';

class DropdownTextFieldWithTitle extends StatelessWidget {
  const DropdownTextFieldWithTitle({
    super.key,
    required this.title,
    required this.items,
    this.onChanged,
    required this.hintText,
    required this.value,
  });

  final String title;
  final List<String> items;
  final void Function(dynamic)? onChanged;
  final String value;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14BlackRegular),
        DropdownButtonFormField(
          icon: SvgPicture.asset(AssetsManager.arrowDown, height: 20),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppPallete.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppPallete.primaryColor),
            ),
          ),
          items: List.generate(
            items.length,
            (index) => DropdownMenuItem(
              value: items[index],
              alignment: Alignment.centerRight,
              child: Text(items[index]),
            ),
          ),
          hint: Text(hintText),
          dropdownColor: Colors.white,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
