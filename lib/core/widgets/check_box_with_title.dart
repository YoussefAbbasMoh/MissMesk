import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class CheckBoxWithTitle extends StatelessWidget {
  const CheckBoxWithTitle({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        Text(title, style: AppTextStyles.font14BlackRegular),
      ],
    );
  }
}
