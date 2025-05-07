import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Switch(
        value: value,
        inactiveTrackColor: AppPallete.lightGreyColor,
        inactiveThumbColor: AppPallete.greyColor,
        activeTrackColor: AppPallete.primaryColor,
        onChanged: onChanged,
        trackOutlineWidth: const WidgetStatePropertyAll(0),
        padding: EdgeInsets.zero,
        activeColor: Colors.white,
      ),
    );
  }
}
