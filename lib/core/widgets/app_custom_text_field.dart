import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class AppCustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final double? width;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool isRequired;

  const AppCustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.width,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: AppTextStyles.font18BlackRegular,
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: AppTextStyles.font18BlackRegular.copyWith(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '* $label الذي أدخلته غير صحيح ';
              }
              return null;
            },
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            cursorColor: AppPallete.primaryColor,
            decoration: InputDecoration(
              focusedBorder: _border(),
              enabledBorder: _border(),
              errorStyle: AppTextStyles.font16BlackRegular.copyWith(
                color: Colors.red,
              ),
              errorBorder: _border(Colors.red),
              hintText: hintText,
              hintStyle: AppTextStyles.font18BlackRegular.copyWith(
                color: AppPallete.lightGreyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border([Color color = AppPallete.primaryColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: color),
    );
  }
}
