import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.borderColor,
    this.color,
    this.titleColor,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        backgroundColor: AppPallete.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        title,
        style: AppTextStyles.font18BlackRegular.copyWith(
          color: titleColor ?? Colors.white,
        ),
      ),
    );
  }
}
