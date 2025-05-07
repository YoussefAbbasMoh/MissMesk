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
    this.isRequired = false,
    this.fillColor,
  });

  final String title;
  final List<String> items;
  final void Function(dynamic)? onChanged;
  final String value;
  final String hintText;
  final bool isRequired;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: AppTextStyles.font14GreyRegular.copyWith(),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: AppTextStyles.font14GreyRegular.copyWith(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        DropdownButtonFormField(
          icon: SvgPicture.asset(AssetsManager.arrowDown, height: 20),
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor != null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: fillColor ?? AppPallete.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: fillColor ?? AppPallete.primaryColor,
              ),
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
