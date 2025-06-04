import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/show_loading.dart';

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
    this.isLoading = false,
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
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading!) {
      return Loading();
    }
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
              isLoading! ? '•••••' : title,
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
