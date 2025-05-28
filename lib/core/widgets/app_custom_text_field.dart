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
  final Color? fillColor;
  final int? minLines;
  final double? titleFontSize;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? isReadOnly;
  final String? Function(String?)? validator;

  const AppCustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.width,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isRequired = true,
    this.fillColor,
    this.minLines,
    this.titleFontSize,
    this.hintTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.initialValue,
    this.isReadOnly,
    this.validator,
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
            style: AppTextStyles.font18BlackRegular.copyWith(
              fontSize: titleFontSize,
            ),
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: isReadOnly ?? false,
            enabled: isReadOnly != true,
            style: AppTextStyles.font18BlackRegular.copyWith(
              fontSize: titleFontSize,
            ),
            initialValue: initialValue,
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.top,
            minLines: minLines ?? 1,
            maxLines: minLines != null ? minLines! + 2 : 1,
            validator: validator,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            cursorColor: AppPallete.primaryColor,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              fillColor: fillColor,
              filled: fillColor != null,
              focusedBorder: _border(fillColor ?? AppPallete.primaryColor),
              enabledBorder: _border(fillColor ?? AppPallete.primaryColor),
              errorStyle: AppTextStyles.font16BlackRegular.copyWith(
                color: Colors.red,
              ),
              focusedErrorBorder: _border(Colors.red),
              errorBorder: _border(Colors.red),
              hintText: hintText,
              hintStyle:
                  hintTextStyle ??
                  AppTextStyles.font18BlackRegular.copyWith(
                    color: AppPallete.lightGreyColor,
                    fontSize: titleFontSize,
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

class ReadOnlyTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;

  const ReadOnlyTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomTextField(
      isReadOnly: true,
      controller: controller,
      titleFontSize: 12,
      label: label,
      isRequired: false,
      hintText: 'ادخل $label',
      hintTextStyle: AppTextStyles.font14GreyRegular,
      initialValue: initialValue,
      fillColor: const Color(0XFFEDE0CC),
    );
  }
}
