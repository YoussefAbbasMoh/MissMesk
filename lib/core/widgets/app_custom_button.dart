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
    this.icon,
    this.borderRadius,
    this.fontSize,
    this.width,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;
  final IconData? icon;
  final double? borderRadius;
  final double? fontSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor ?? Colors.transparent),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          backgroundColor: color ?? AppPallete.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text(
              title,
              style: AppTextStyles.font18BlackRegular.copyWith(
                color: titleColor ?? Colors.white,
                fontSize: fontSize,
              ),
            ),
            if (icon != null) Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
