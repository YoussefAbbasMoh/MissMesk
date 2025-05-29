import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: 
        (context) => const Center(
          child: CircularProgressIndicator(color: AppPallete.primaryColor),
        ),
  );
}
